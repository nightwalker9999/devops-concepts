variable "file_content" {
    description = "Content of the file"
    type = string
    default = "Added Back after some chnages and stuff!"
}

variable "file_name" {
    description = "Name of the file"
    type = string
    default = "arjun_variable_demo.txt"
}

variable "some_number" {
    description = "Var of num datatype"
    type = number
    default = 5
}

variable "number_file_name" {
    description = "Name of the Number file"
    type = string
    default = "arjun_num_var.txt"
}

resource "local_file" "dynamic" {
    content = var.file_content
    filename = var.file_name
}

resource "local_file" "dynamic_num" {
    content = var.some_number
    filename = var.number_file_name
}