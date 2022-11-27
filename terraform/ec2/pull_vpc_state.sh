#!/bin/sh

# match to file in terraform/ec2/config
config_profile="$1"

# AWS variables
aws_region="us-west-2"
aws_session="pullVpcState"

# SSM Parameter Store variables
project="fr-4640-term"
state_path="state/vpc"
vpc_id_param="/$project/$state_path/id"
private_subnets_param="/$project/$state_path/private_subnets"
public_subnets_param="/$project/$state_path/public_subnets"
app_sg_id_param="/$project/$state_path/sg/app"
db_sg_id_param="/$project/$state_path/sg/db"

cp state.tfvars.tpl state.tfvars

get_ssm_value(){
  aws ssm get-parameter --region $aws_region --name $aws_session | jq -r .Parameter.Value
}

vpc_id=$(get_ssm_value $vpc_id_param)
app_sg=$(get_ssm_value $app_sg_id_param)
db_sg=$(get_ssm_value $db_sg_id_param)

# TODO: better logic required to spread instances over multiple AZ
private_subnet0=$(get_ssm_value $private_subnets_param | cut -d "," -f 1)
public_subnet0=$(get_ssm_value $public_subnets_param | cut -d "," -f 1)

# Feed ec2 configuration template into state.tfvars file
cat "config/$1" >> state.tfvars

# Inject current state information into ec2 configuration template
sed -i "s|PRIV_SUBNET|$private_subnet0|g" state.tfvars
sed -i "s|PUB_SUBNET|$public_subnet0|g" state.tfvars
sed -i "s|VPC_ID|$vpc_id|g" state.tfvars
sed -i "s|APP_SG|$app_sg|g" state.tfvars
sed -i "s|DB_SG|$db_sg|g" state.tfvars

cat state.tfvars
