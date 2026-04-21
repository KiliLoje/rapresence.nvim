(lookup_definition_header "Lookup" @keyword)
(lookup_definition_header ":" @punctuation.delimiter)
(lookup_definition_header (identifier) @type)

(format_definition_header "Format" @keyword)
(format_definition_header ":" @punctuation.delimiter)
(format_definition_header (identifier) @type)

(display_definition_header "Display" @keyword)
(display_definition_header ":" @punctuation.delimiter)

(lookup_statement "=" @punctuation)
(lookup_statement
  (key
    (key_item
      (range "-" @punctuation))))
(lookup_statement
  (key
    (key_item
      (number "*" @punctuation))))

(format_type_definition "FormatType" @constructor)
(format_type_definition "=" @punctuation)
(format_type_definition (format_type) @constant)

(conditional_display (condition) @property)
(display_statement
  (macro "@" @label))
(display_statement
  (macro (identifier) @label))
(display_statement
  (macro "(" @punctuation))
(display_statement
  (macro ")" @punctuation))
(display_statement
  (macro (logic) @function))

(comment) @comment
(number) @number
