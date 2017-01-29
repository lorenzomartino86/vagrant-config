FROM java:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

# curl -fsSL 'https://www.apache.org/dist/tomee/KEYS' | awk -F ' = ' '$1 ~ /^ +Key fingerprint$/ { gsub(" ", "", $2); print $2 }' | sort -u
ENV GPG_KEYS \
	mQENBFLd7F8BCAC+CMcP18EEE9Im+JHg6GoIw0UD6/MDCh8ujNQARfBy98bWFVy6 \
    xahpZ+HcyUNaPczau4ilpjebKdsCR44Gi7VAme5Qogfh2FNei1sQqxg64irQqd87 \
    p+3obBN1zl2hYgT98XXhVj8UWary48JvY6yg/9gNjTJQYB/9g2fA4AbdcQrarsoO \
    SKytuWKSGmNSgDabqLciC/bWbcmv280BzNqpf73x/W2ULRIk9u2WMm8cNX1SCr2E \
    1LOxJWQHWtMLuXHkhvn/9otzLWc+4qVqWHR48P/1dj5ecVnzT1LUzsDABOs4Hm5z \
    CSqJHLFEGmEtiauwM2TgOEmOQj8re3FuBAJ7ABEBAAG0JkplcmVteSBXaGl0bG9j \
    ayA8andoaXRsb2NrQGFwYWNoZS5vcmc+iQE4BBMBAgAiBQJS3exfAhsDBgsJCAcD \
    AgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAxgkL+mgsRg5n/B/wJj874epfM+JiVK+gk \
    2XnF/2fzpcKcCiLNbExIUw12vXYMuU/YdvY2j5vC4BpPPgOD6bWAzn9VJZpFERV+ \
    yhO+/9nvzC/risUQby6wAaM8ATr6V95+cNRPuP4boDifsqH8kRB+zbucjdL2lsPD \
    WaiT8PO5tkrzjkJUTdy2xS+X3B/nREnfN6YmG64yIGUenHLx/xlnExvr2yq61OBL \
    6SToZmwPHLrowYpFbHVbSlQIpxV8R8y6PREcwu1lCdHXYxtdGU53ijCWrpo6VKZT \
    mFqnsd+aDNZVisoGVwWuD0JPidNs0kkJc5ZJtcy6zzCljfBWnGWX+IrUZU9lx9rM \
    li35uQENBFLd7F8BCADVyFD06kbEIl7XQM4kvlJz5yZTBqW1haUAXbiPzleuYCH/ \
    8a2P5+bDXTuekH5xkysIrW+JHz3hsOM031zdr6iVTs5PkcsttDUMgzMwOZ4lxoyg \
    QWmXqlvWvgs705U7Aunnl4Ly1jtNHnW0UWOKatZm8b1bbYYa6GUnd72uJSsc2Wps \
    BWoJjM0wr7HwBBH3362l6hO40xCgWnGp7FgHXNtbgJhnpsr9lyqKQbTOF0ADT96n \
    1L/m9G/zaiZD4G166F6FYmydmo41VEreC7HoEhksdIxzaU2KTSuD+EFu23XKM9Sd \
    DgYcw4husJ9PrDSFob/+MHrenU7cq8uKks+P2NtLABEBAAGJAR8EGAECAAkFAlLd \
    7F8CGwwACgkQMYJC/poLEYOpRQgAspxGdI9xXW4U7P9jDfDaNInQt71u0M/9yqm5 \
    Y8F2OC9avYaGY1Vw/XqiTWZgEahqTaOK+pCIVuQMgXLxjE5zXZEDPiGPjdW+joc4 \
    4wPx+QR0IRwwdYT066W2Gw6zhT/xczqzv/5ecvCV21jMdnpPy3M47db+QGzoVebG \
    SaALfkTaQdOw4ym5lCj92YwMM+pfKTyUF22VbBrYg7M7CaDdwV7qNI2mWecSjtlG \
    ZLNnKkAAHpiKIrXt8f00hllmNm2HlFqjUH4vaPMeAA6GOdUbmhKS70e20+fBiNX8 \
    Sb6ZmkZeA+0vPd3OKLCEkjmEZwE5BfiL9wnKqSGZucu9upq5lQ== \
    =Lt0z
RUN set -xe \
	&& for key in $GPG_KEYS; do \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	done

RUN set -x \
	&& curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-1.7.4/apache-tomee-1.7.4-plus.tar.gz.asc -o tomee.tar.gz.asc \
	&& curl -fSL http://apache.rediris.es/tomee/tomee-1.7.4/apache-tomee-1.7.4-plus.tar.gz -o tomee.tar.gz \
	&& gpg --batch --verify tomee.tar.gz.asc tomee.tar.gz \
	&& tar -zxf tomee.tar.gz \
	&& mv apache-tomee-plus-1.7.4/* /usr/local/tomee \
	&& rm -Rf apache-tomee-plus-1.7.4 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz*


EXPOSE 8080
CMD ["catalina.sh", "run"]