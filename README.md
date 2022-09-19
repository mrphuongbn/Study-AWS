# Các định nghĩa infra
- terraform.tfstate là file lưu trạng thái của terraform, đã được đồng bộ lên gitlab.
- versions.tf là file lưu các thông tin về phiên bản các thành phần.
- eks-clusters.tf: Thông tin eks
- outputs.tf: các giá trị muốn xuất ra sau khi apply terraform
- var.tf: danh sách các biến
- main.tf: thông tin providers, config AWS
- vpc.tf: thông tin network

# Cấu hình aws
```
  aws configure sso
        SSO start URL [None]: [None]: https://d-966702f6fa.awsapps.com/start/
        SSO region [None]: ap-southeast-1
    # Dùng mũi tên để chọn tài khoản
        There are 2 AWS accounts available to you.
        > ttpt-external-rd, aws-ttpt-ex-rd@mbbank.com.vn (801964442423)   
          ttpt-dev, aws-ttpt-dev@mbbank.com.vn (068313291995) 
    #Nhập theo hướng dẫn:
        CLI default client Region [None]: ap-southeast-1 <ENTER>
        CLI default output format [None]: json<ENTER>
        CLI profile name [mb-ttpt-dev-role-068313291995]: ttpt-dev-profile <ENTER>
  aws sso login --profile sso

   # Kiểm tra lại tại: ~/.aws/config 
    [profile ttpt-dev]
    sso_start_url = https://d-966702f6fa.awsapps.com/start/
    sso_region = ap-southeast-1
    sso_account_id = 068313291995
    sso_role_name = mb-ttpt-dev-role
    region = ap-southeast-1
    output = json

  ## Tham khảo thêm tại: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html "

```

# Vận hành Terraform

- Chạy lệnh

```
export AWS_PROFILE="test"
  terraform init
  terraform plan
  terraform apply
```
AWS_PROFILE="test" để chỉ định AWS profile sẽ chạy 
- Show output
```
  terraform show
```
- Cập nhật kubectl context

```
aws eks --region ap-southeast-1 update-kubeconfig --name <cluster_name> --profile {profile_name}
```

