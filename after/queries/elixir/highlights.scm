;; anonymous

"(" @punctuation.bracket
")" @punctuation.bracket
"=" @operator
"==" @operator
"=>" @operator
"->" @operator
"!" @operator
"+" @operator
"-" @operator
"<>" @operator
"<<" @operator
">>" @operator
"::" @operator
"," @punctuation.delimiter
"[" @punctuation.bracket
"]" @punctuation.bracket

"case" @keyword
"cond" @keyword
"fn" @keyword
"do" @keyword
"end" @keyword
"def" @keyword
"defp" @keyword

"for" @keyword
"if" @keyword
"unless" @keyword
"when" @keyword

;; Function calls

(qualified_function_name
 "." @operator
 function_name: (variable) @function.call)

(computed_function_name
 (variable) @function.call)

;; Definitions
(defmodule
  "defmodule" @keyword
  modulename: (_) @type
  (do_block))

(module_attribute
 "@" @property.definition
 (identifier) @property
 (_))

(def
 ["def" "defp"]
 [(atom)
  (identifier) @function]
 arguments: (variable)?
 (guard_clause)?
 (do_block))

(do_block
 [("do" @keyword
   (_)
   "end" @keyword)
  (", " @punctuation.delimiter
   "do:" @keyword
   (_))])

(alias) @type

;; Literals
(atom) @constant.builtin
(number) @number

((variable) @comment
 (.match? @comment "^_"))
(variable) @variable

(boolean) @constant.builtin
(comment) @comment

;; string

(interpolation
 "#{" @punctuation.special
 (_)?
 "}" @punctuation.special)

(module_attribute
 "@" @property.definition
 ((identifier) @property
  (.match? @property "doc$"))
 (string) @doc)

(string) @string

(charlist) @string

(char) @string

(bin_type) @type.builtin

;; map

(map
 "%" @punctuation.special
 "{" @punctuation.special
 "}" @punctuation.special)

(struct
 "%" @punctuation.special
 "{" @punctuation.special
 "}" @punctuation.special)

;; sigil

(sigil) @string
