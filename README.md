# LaTeX Workspace with Docker

- Usage:

    ```shell
    docker compose up -d
    ```

- Change your working directory

    ```shell
    volumes:
        - ./<directory name>:/root/latex/<directory name>
    ```

- Export PDF with tex2pdf command:

    ```shell
    tex2pdf <filename.tex>
    t2p <filename.tex>
    ```
