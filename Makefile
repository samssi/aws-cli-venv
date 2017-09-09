clean:
	@find . -name '*.py?' -delete
	@find . -name '.cache' -type d | xargs rm -rf
	@find . -name '__pycache__' -type d | xargs rm -rf
	@rm -rf envs/

aws: aws-requirements.txt
	@test -d envs/aws || virtualenv -p python3 envs/aws
	envs/aws/bin/pip install --upgrade pip
	envs/aws/bin/pip install --no-cache-dir -Ur aws-requirements.txt || exit -1
	touch envs/aws/bin/activate

envs: aws

