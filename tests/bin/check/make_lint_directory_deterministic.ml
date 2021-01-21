(* OCaml implementation of bash's
sed "s/lint of .* and/lint of <project_dir> and/" *)

let parse_stdin () =
  let re =
    let open Re in
    compile @@ seq [ str "lint of "; rep any; str " and" ]
  in
  try
    while true do
      let line = read_line () in
      Re.replace_string re ~by:"lint of <project_dir> and" line |> print_endline
    done
  with End_of_file -> ()

let () = parse_stdin ()
