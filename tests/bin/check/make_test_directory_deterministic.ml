(* OCaml implementation of bash's
sed 's/\/.*\/tests\/bin\/check/<test_directory>/' *)

let parse_stdin () =
  let re =
    let open Re in
    compile @@ seq [ str "/"; rep any; str "/tests/bin/check" ]
  in
  try
    while true do
      let line = read_line () in
      Re.replace_string re ~by:"<test_directory>" line |> print_endline
    done
  with End_of_file -> ()

let () = parse_stdin ()
