archlinux:
	docker build -t arch . && \
	docker run --network host -it --rm arch
