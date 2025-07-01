resource "aws_instance" "project" {
    count = length(var.instances)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.Hackouting.id]
    instance_type = var.instance_type
    
 tags=merge(
        var.commn_tags,
        {
            Name = "${var.project}-${var.instances[count.index]}-${var.environment}"
            Environment = var.environment
            Commponent = var.instances[count.index]
        }

    )

}

resource "aws_security_group" "Hackouting" {
    name = "${var.project}-${var.sg_name}-${var.environment}"
    description = var.sg_description

    ingress{
        from_port = 0
        to_port =  0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
   egress{
        from_port = 0
        to_port =  0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags=merge(
        var.commn_tags,
        {
            Name = "${var.project}-${var.sg_name}-${var.environment}"
        }

    )
}