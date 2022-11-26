#!/bin/bash

ssm_wandb_api_key="/dalle-mini/secrets/wandb-api-key"
ssm_aws_acc_key="/dalle-mini/secrets/access-key"
ssm_aws_sec_key="/dalle-mini/secrets/secret-key"
ssm_aws_session="/dalle-mini/secrets/session-token"
ssm_aws_prompt="/dalle-mini/prompt/$1"

get_ssm_value(){
  aws ssm get-parameter --name $1 | jq -r .Parameter.Value
}

api_key=$(get_ssm_value "$ssm_wandb_api_key")
prompt=$(get_ssm_value "$ssm_aws_prompt")
