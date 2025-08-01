// Var of string datatype
variable "file_content" {
    description = "Content of the file"
    type = string
    default = "This is the file content i.e string"
}

variable "file_name" {
    description = "Name of the file"
    type = string
    default = "arjun_var_str_file.txt"
}

// Var of num datatype
variable "file_number" {
    description = "Var of num datatype"
    type = number
    default = 5
}

variable "file_number_name" {
    description = "Name of the Number file"
    type = string
    default = "arjun_var_num_file.txt"
}

// Var of bool datatype
variable "file_bool" {
    description = "Var of bool datatype"
    type = bool
    default = true
}

variable "file_bool_name" {
    description = "Name of the Bool file"
    type = string
    default = "arjun_var_bool_file.txt"
}

// resource for string datatype
resource "local_file" "dynamic_str" {
    content = var.file_content
    filename = var.file_name
}

// resource for num datatype
resource "local_file" "dynamic_num" {
    content = var.file_number
    filename = var.file_number_name
}

// resource for bool datatype
resource "local_file" "dynamic_bool" {
    content = var.file_bool
    filename = var.file_bool_name
}

//output for string datatype
output "created_filename_str" {
    description = "Name of the file created by Terraform for string datatype"
    value = local_file.dynamic_str.filename
}

//output for num datatype
output "created_filename_num" {
    description = "Name of the file created by terraform for num datatype"
    value = local_file.dynamic_num.filename
}

//output for bool datatype 
output "created_filename_bool" {
    description = "Name of the file created by terraform for bool datatype"
    value = local_file.dynamic_bool.filename
}

