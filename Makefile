IMAGE_BUILD = .image-build-done

.PHONY: clean
clean:
	rm -rf out/

.PHONY: purge
purge: clean taint-image

.PHONY: image-build
image-build: $(IMAGE_BUILD)

.PHONY: build
build: clean image-build
	@docker-compose run --rm ipxe

# Hidden target here to ensure the image is built
# only when the Dockerfile is actually updated
$(IMAGE_BUILD): Dockerfile
	@docker-compose build
	@touch $@

.PHONY: taint-image
taint-image:
	rm -f $(IMAGE_BUILD)
