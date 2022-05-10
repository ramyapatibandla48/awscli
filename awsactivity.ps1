#creating a vpc in ap-soth-1 region
 aws ec2 create-vpc --cidr-block '10.10.0.0/16' `
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=myvpc}]'
#"VpcId": "vpc-03e790b502b730767"

#creating web1 subnet in availability zone south-1a
aws ec2 create-subnet  --vpc-id 'vpc-03e790b502b730767' `
    --availability-zone 'ap-south-1a' `
    --cidr-block '10.10.0.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web1}]'
#subnet-04f858ae0c66ba460

#creating db1 subnet in availability zone south-1a
aws ec2 create-subnet  --vpc-id 'vpc-03e790b502b730767' `
    --availability-zone 'ap-south-1a' `
    --cidr-block '10.10.1.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=db1}]'
#subnet-subnet-0eb02097d910cf6bf"

#creating web2 subnet in availability zone south-1b
aws ec2 create-subnet  --vpc-id 'vpc-03e790b502b730767' `
    --availability-zone 'ap-south-1b' `
    --cidr-block '10.10.2.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web2}]'
#subnet-0c00762654b507f73

# creating db2 subnet in availability zone south-1b
aws ec2 create-subnet  --vpc-id 'vpc-03e790b502b730767' `
    --availability-zone 'ap-south-1b' `
    --cidr-block '10.10.3.0/24' `
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=db2}]'
#subnet-subnet-06d86dadab0df7639

#adding internet gateway 
aws ec2 create-internet-gateway `
    --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=my-igw}]'
#igw-05039bab8096e5b94

#attaching internetgateway to vpc
aws ec2 attach-internet-gateway `
    --internet-gateway-id 'igw-05039bab8096e5b94' `
    --vpc-id 'vpc-03e790b502b730767'

#creating route table and attach it to public
aws ec2 create-route-table `
    --vpc-id 'vpc-03e790b502b730767' `
    --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=public}]'
#rtb-0f9629ec7cd5b8dd8

#adding web1 subnets to route table
aws ec2 associate-route-table `
    --route-table-id 'rtb-0f9629ec7cd5b8dd8' `
    --subnet-id 'subnet-04f858ae0c66ba460' 
#AssociationId": rtbassoc-0075bc2d9dbfb1bb1

#creating route to web1
aws ec2 create-route `
    --route-table-id  'rtb-0f9629ec7cd5b8dd8' `
    --gateway-id 'igw-05039bab8096e5b94' `
    --destination-cidr-block 0.0.0.0/0

#adding route to db1
aws ec2 associate-route-table `
    --route-table-id 'rtb-0f9629ec7cd5b8dd8' `
    --subnet-id 'subnet-0eb02097d910cf6bf' 
#rtbassoc-05b1e944f6ef63535

#creating a key pair
aws ec2 create-key-pair `
    --key-name 'ansible' 
   
#creating security group
aws ec2 create-security-group `
    --group-name 'ansible1' `
    --description 'ansible1 group name' `
    --vpc-id 'vpc-03e790b502b730767' 
 #"GroupId": "sg-0f2bfebc4b9d06c93"
 
#creating ec2 instance t2micro
aws ec2 run-instances `
    --image-id 'ami-0756a1c858554433e'  --count 1 `
    --instance-type 't2.micro' `
    --key-name 'ansible' `
    --security-group-ids 'sg-0f2bfebc4b9d06c93' `
    --subnet-id 'subnet-04f858ae0c66ba460' `
    --Auto-assign-public 'enable'
 #InstanceId": "i-02e2e45a41999e609




