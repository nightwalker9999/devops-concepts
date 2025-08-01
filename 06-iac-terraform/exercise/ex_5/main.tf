// Var of string datatype
variable "file_string" {
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

// Mixed datatype
resource "local_file" "dynamic_mixed" {
    filename = "arjun_mixed_datatype.txt"
    content = <<EOT
String: ${var.file_string}
Number: ${tostring(var.file_number)}
Bool: ${tostring(var.file_bool)}
EOT    
}

// Output for mixed datatype
output "created_filename_mixed" {
    description = "Mixed datatype filename"
    value = local_file.dynamic_mixed.filename
}
