# LaTeX Workspace with Docker

- Usage:

    ```shell
    docker compose up -d
    ```

  - or use `devcontainer`

- Change the working directory in `docker-compose.yaml`:

    ```yaml
    volumes:
        - ./<directory name>:/root/latex/<directory name>
    ```

- Export PDF with tex2pdf command:

    ```shell
    tex2pdf <filename without .tex>
    t2p <filename without .tex>
    ```
