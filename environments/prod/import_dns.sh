#!/bin/bash

# ZONE_ID 확인
if [ -z "$ZONE_ID" ]; then
    echo "ZONE_ID 환경변수를 설정해주세요."
    exit 1
fi

# 임시 파일에 DNS 레코드 저장
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records" \
     -H "X-Auth-Email: hakang@mz.co.kr" \
     -H "X-Auth-Key: f6f652701a00dc80fc3c5e764adb1b84461e3" \
     -H "Content-Type: application/json" > dns_records.json

# DNS 레코드 하나씩 처리
jq -r '.result[] | [.type, .name, .id] | @tsv' dns_records.json | while IFS=$'\t' read -r type name id; do
    cmd="terraform import -var-file=../../terraform.tfvars 'module.dns.cloudflare_record.records[\"$type-$name\"]' '$ZONE_ID/$id'"
    echo "Executing: $cmd"
    eval "$cmd"
done

# 임시 파일 삭제
rm dns_records.json
