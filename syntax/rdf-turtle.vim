" Vim syntax file 
" Language: RDF/Turtle 
" Maintainer: Erik Pitzer <erik.pitzer@fh-hagenberg.at>
" Last Change: 23 Jun 2014
" Remark: This syntax file only supports RDF/Turtle
" http://www.w3.org/TR/turtle/

"syntax match rdfDirectiveKeyword "@[a-zA-Z][a-zA-Z0-9]*"
"syntax match rdfDirectiveKeyword "\<[A-Z][A-Z0-9]*\>"
"highlight link rdfDirectiveKeyword Keyword

" old
"syntax match rdfIRI "<[^>]*>" nextgroup=rdfIdentifier
"syntax match rdfPrefix "[A-Za-z]*:" nextgroup=rdfIdentifier
"highlight link rdfIRI Constant
"highlight link rdfPrefix Constant
"syntax match rdfIdentifier "[^ ]\+" contained
"highlight link rdfIdentifier Identifier


syntax match rdfStatement "\(\[\_s*\)\=\(<[^>]\+>\|[^.; ]\+\)\([ \n;()\[\]]\+\(<[^>]\+>\|[^.; ]\+\)\_s*\)\+\(\]\_s*\)\=\." contains=rdfObject,rdfPredicate,rdfSubject,rdfSeparator 
syntax match rdfDirective "^@[a-zA-Z][a-zA-Z0-9]*\s\+\(<[^>]\+>\|[^. ]\+\)\s\+\(<[^>]\+>\|[^. ]\+\)\s*\."
highlight link rdfDirective Keyword
"highlight link rdfStatement Identifier


syntax match rdfObject "[^;.()\[\] ]\+" contained skipwhite skipempty nextgroup=rdfObject
syntax match rdfPredicate "[^;\[\].() ]\+" contained skipwhite skipempty nextgroup=rdfObject
syntax match rdfSubject "\(\[\]\|[^;\[\](). ]\+\)" contained skipwhite skipempty nextgroup=rdfPredicate
highlight link rdfSubject Constant
highlight link rdfPredicate Keyword
highlight link rdfObject Identifier

syntax match rdfSeparator "\." skipwhite skipempty contained nextgroup=rdfSubject
syntax match rdfSeparator ";" skipwhite skipempty contained nextgroup=rdfPredicate
syntax match rdfSeparator "\[\|\]" skipwhite skipempty contained nextgroup=rdfPredicate
syntax match rdfSeparator "(\|)" skipwhite skipempty contained nextgroup=rdfObject
highlight link rdfSeparator SpecialChar

syntax match rdfComment /\#.*$/
highlight link rdfComment Comment

"highlight link rdfEmpty Keyword
"highlight link rqBuiltinCall Keyword
"highlight link rqStringSingle String 
"highlight link rqStringLongSingle String 
"highlight link rqStringDouble String 
"highlight link rqStringLongDouble String 
"highlight link rqRdfType Constant 
"highlight link rqQIRIREF Constant
"highlight link rqBoolean Constant
"highlight link rqQnamePrefix Macro
"highlight link rqStringEscape SpecialChar 


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sparql_syn_inits")
  if version < 508
    let did_sparql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

"  HiLink mysqlKeyword		 Statement

  delcommand HiLink
endif

let b:current_syntax = "rdf-turtle"

