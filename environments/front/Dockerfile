FROM dart:2.16.2 as builder

RUN apt install git 
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH "$PATH:/root/flutter/bin"

RUN flutter config --enable-web

COPY pubspec.yaml .
RUN flutter pub get 

COPY lib/ lib/
RUN flutter create .
ARG endpoint
ENV FEEDBACK_ENDPOINT $endpoint
RUN flutter build web --dart-define=FEEDBACK_ENDPOINT=${FEEDBACK_ENDPOINT}

FROM nginx:alpine
WORKDIR /var/www/html/feedback
COPY --from=builder /root/build/web/ ./