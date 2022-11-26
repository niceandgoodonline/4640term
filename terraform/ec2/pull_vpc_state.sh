#!/bin/sh

config_profile="$1"
project="fr-4640-term-backend"
private_subnets_param="/$project/state/vpc/private_subnets"
public_subnets_param="/$project/state/vpc/public_subnets"
frontend_sg_id_param="/$project/state/vpc/sg/frontend"
db_sg_id_param="/$project/state/vpc/sg/db"
vpc_id_param="/$project/state/vpc/id"

cp state.tfvars.tpl state.tfvars

get_ssm_value(){
  aws ssm get-parameter --name $1 | jq -r .Parameter.Value
}

get_ssm_value $private_subnets_param > private.subnets
get_ssm_value $public_subnets_param > public.subnets

vpc_id=$(get_ssm_value $vpc_id_param)
frontend_sg=$(get_ssm_value $frontend_sg_id_param)
db_sg=$(get_ssm_value $db_sg_id_param)

private_array="[$(sed "s|,|\",\"|g" private.subnets)]"
public_array="[$(sed "s|,|\",\"|g" public.subnets)]"
rm *.subnets

sed -i "s|PRIVATE_SUBNETS|$private_array|g" state.tfvars
sed -i "s|PUBLIC_SUBNETS|$public_array|g" state.tfvars
sed -i "s|VPC_ID|$vpc_id|g" state.tfvars
sed -i "s|FRONTEND_SG|$frontend_sg|g" state.tfvars
sed -i "s|DB_SG|$db_sg|g" state.tfvars

cat state.tfvars

cat "config/$1" >> state.tfvars
