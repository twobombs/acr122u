FROM twobombs/deploy-nvidia-docker:minimum

RUN apt update && apt install -y maven libpcsclite1 pcsc-tools pcscd

RUN git clone https://github.com/mdeverdelhan/ACR122U-reader-writer.git && cd ACR122U-reader-writer && mvn clean package
RUN echo "export DISPLAY=:0&&xterm -e 'cd /ACR122U-reader-writer/target && java -jar acr122urw.jar -h' " >> /root/run-minimum

EXPOSE 5900 6080
ENTRYPOINT /root/run-minimum
