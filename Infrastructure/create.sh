echo "Enter Stack Name"
read stackName

curr_dir=$(pwd)

para_file="file://$curr_dir/parameters.json"
template_file="file://$curr_dir/infra.yaml"

stackId=$(aws cloudformation create-stack --stack-name $stackName --template-body $template_file --parameters $para_file --capabilities CAPABILITY_NAMED_IAM --query [StackId] --output text)

echo "Stack ID: '$stackId'"

aws cloudformation wait stack-create-complete --stack-name $stackId

echo $stackID

if [ -z $stackID ]; then
    echo 'Error. Stack creation failed !!!'
	exit 1
else
	echo "Stack Creation Done !!!"
fi