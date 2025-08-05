# Terraform resource loops 
# Using `count`
/*
variable "file_names" {
    type = list(string)
    default = ["first.txt", "second.txt", "third.txt"]
}

resource "local_file" "multi" {
    count = length(var.file_names)
    filename = var.file_names[count.index]
    content = "This is file number ${count.index + 1}"
}
*/

# Using `for_each`
/*
variable "special_files" {
    type = set(string)
    default = ["devops.txt", "terraform.txt", "awscli.txt"]
}

resource "local_file" "foreach_example" {
    for_each = var.special_files
    filename = each.key
    content = "This is the file: ${each.value}"
}
*/


# Dynamic Blocks
# Dynamic block for multiple lines in a file

variable "lines" {
    type = list(string)
    default = ["This is line 1", "This is line 2", "This is line 3"]
}

resource "local_file" "multi_line_file" {
    filename = "multi_line.txt"
    content = join("\n", var.lines)
}