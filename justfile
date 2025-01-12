default_mode := "gradio"

play mode=default_mode: shell
    poetry run python3 -m plurigrid.agent --agent play_coplay --mode "{{mode}}"

summon prompt mode=default_mode:
    poetry run python3 -m plurigrid.agent --agent digital_twin --prompt "{{prompt}}" --mode "{{mode}}"

ontology knowledge-base mode="repl":
    python3 -m plurigrid.agent --agent ontology --mode "{{mode}}" --path "{{knowledge-base}}"

docker:
    docker run -it --platform=linux/amd64 -v "$(pwd)":/plurigrid nixos/nix bash -c "cd /plurigrid;nix-shell"

run:
	#nix-channel --update
	nix-shell --run "poetry update"

shell: run
	nix-shell --run "poetry shell"

install_nix:
    bash "$(pwd)/scripts/install_nix.sh"

install_docker:
    bash "$(pwd)/scripts/install_docker.sh"

mac_play:
    bash "$(pwd)/scripts/start_plurigrid.sh"
