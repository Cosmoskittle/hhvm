(**
 * Copyright (c) 2015, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * This module helps find the code extent (character position ranges in
 * the source file) of each node in the AST output by the hack parser.
 *)
open Ast

(* utility functions*)
val parse_file : Relative_path.t -> Parser_hack.parser_return
val lexing_slice_to_string : (File_pos.t * File_pos.t) -> string -> string
val format_file_pos : File_pos.t -> string

type tokens = (Lexer_hack.token * Pos.t * string) list
val tokenize : Relative_path.t -> string -> tokens

val position_min : File_pos.t -> File_pos.t -> File_pos.t
val position_max : File_pos.t -> File_pos.t -> File_pos.t

(* source extent finding functions *)
val source_extent_catch : Relative_path.t -> string -> catch ->
                          (File_pos.t * File_pos.t)
val source_extent_do : Relative_path.t -> string -> block -> expr ->
                       (File_pos.t * File_pos.t)
val source_extent_efun : Relative_path.t -> string ->fun_ -> (id * bool) list ->
                         (File_pos.t * File_pos.t)
val source_extent_eif : Relative_path.t ->
                        string ->
                        expr ->
                        expr option ->
                        expr ->
                        (File_pos.t * File_pos.t)
val source_extent_expr : Relative_path.t -> string -> expr ->
                         (File_pos.t * File_pos.t)
val source_extent_for : Relative_path.t ->
                        string ->
                        expr ->
                        expr ->
                        expr ->
                        block ->
                        (File_pos.t * File_pos.t)
val source_extent_foreach : Relative_path.t -> string ->
                            expr -> Pos.t option -> as_expr -> block ->
                            (File_pos.t * File_pos.t)
val source_extent_hint : Relative_path.t -> string -> hint ->
                         (File_pos.t * File_pos.t)
val source_extent_if : Relative_path.t -> string -> expr -> block -> block ->
                       (File_pos.t * File_pos.t)
val source_extent_lfun: Relative_path.t -> string -> fun_ ->
                        (File_pos.t * File_pos.t)
val source_extent_stmt : Relative_path.t -> string -> stmt ->
                         (File_pos.t * File_pos.t)
val source_extent_switch : Relative_path.t -> string -> expr -> case list ->
                           (File_pos.t * File_pos.t)
val source_extent_throw : Relative_path.t -> string -> expr ->
                          (File_pos.t * File_pos.t)
val source_extent_try : Relative_path.t ->
                        string ->
                        block ->
                        catch list ->
                        block ->
                        (File_pos.t * File_pos.t)
val source_extent_while : Relative_path.t -> string -> expr -> block ->
                          (File_pos.t * File_pos.t)
val source_extent_class_ : Relative_path.t -> string -> class_ ->
                           (File_pos.t * File_pos.t)
val source_extent_class_header : string -> class_ -> (File_pos.t * File_pos.t)

val source_extent_def : Relative_path.t -> string -> def ->
                        (File_pos.t * File_pos.t)
val source_extent_class_elt : string -> class_elt -> (File_pos.t * File_pos.t)

val source_extent_fun_ : Relative_path.t -> string -> fun_ ->
                         (File_pos.t * File_pos.t)
val source_extent_typeConst : string -> typeconst -> (File_pos.t * File_pos.t)

val source_extent_classUse : string -> hint -> (File_pos.t * File_pos.t)

val source_extent_method_ : Relative_path.t -> string -> method_ ->
                            (File_pos.t * File_pos.t)
val source_extent_program : Relative_path.t -> string -> program ->
                            (File_pos.t * File_pos.t)
