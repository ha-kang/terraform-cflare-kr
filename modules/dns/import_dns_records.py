# import_dns_records.py
import json
import subprocess
import os

# DNS records.json 파일 읽기
with open('dns_records.json', 'r') as f:
    dns_data = json.load(f)

# ZONE_ID 환경변수에서 가져오기
zone_id = os.environ.get('ZONE_ID')

# 각 레코드에 대해 import 명령어 생성 및 실행
for record in dns_data['result']:
    record_type = record['type']
    record_name = record['name']
    record_id = record['id']
    
    # Terraform import 명령어 생성
    import_cmd = f"terraform import 'module.dns.cloudflare_record.records[\"{record_type}-{record_name}\"]' {zone_id}/{record_id}"
    
    # 명령어 출력 및 실행
    print(f"Executing: {import_cmd}")
    subprocess.run(import_cmd, shell=True)
