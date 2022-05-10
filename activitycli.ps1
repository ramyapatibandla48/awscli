#creating vpc
aws ec2 create-vpc --cidr-block '10.10.0.0/16' `
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=myvpc}]'
# VpcId: "vpc-0ed059c91b59d4a1f"

# creating web1 subnet 
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1a' `
    --cidr-block '10.10.0.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web1}]'
# SubnetId: "subnet-03624860b0abe44b4"

#creating web2 subnet
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1b' `
    --cidr-block '10.10.1.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web2}]'
# "SubnetId": "subnet-062d338ad0f67582b

#creating app1 subnet
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1a' `
    --cidr-block '10.10.2.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=app1}]'
#subnet-0b088504763c2dcab"

#creating app2 subnet
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1b' `
    --cidr-block '10.10.3.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=app2}]'
#subnet-0579b80577d144cbc

#creating db1 subnet
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1a' `
    --cidr-block '10.10.4.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=db1}]'
#subnet-0e6534b3d192a6549

#creating db2 subnet
aws ec2 create-subnet --vpc-id 'vpc-0ed059c91b59d4a1f' --availability-zone 'ap-south-1b' `
    --cidr-block '10.10.5.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=db2}]'
#"subnet-08a9ed53592050dc0

#adding internet gateway 
aws ec2 create-internet-gateway `
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=my-igw}]'
#igw-01df4193109fe1f8d

#attaching internetgateway to vpc
aws ec2 attach-internet-gateway `
    --internet-gateway-id 'igw-01df4193109fe1f8d' `
    --vpc-id 'vpc-0ed059c91b59d4a1f'
    
#creating route table and attach it to public
aws ec2 create-route-table `
    --vpc-id 'vpc-0ed059c91b59d4a1f' `
    --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=public}]'
#"rtb-010aa3a8e5425f7cc

    
#creating route table and attach it to private
aws ec2 create-route-table `
    --vpc-id 'vpc-0ed059c91b59d4a1f' `
    --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=private}]'
    # rtb-0cab5c43ec38af1e5
    



