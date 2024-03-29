# ButtKicker

ButtKicker is a lightweight stateless webhook gateway designed to efficiently redirect triggers to the desired endpoints.

## Usage

### 1. Running ButtKicker

To run ButtKicker, use Docker:

```sh
docker run \
  -p 4000:4000 \
  -e SECRET_KEY_BASE=some-random-string \
  ghcr.io/txssu/butt_kicker:latest
```

Ensure to replace `some-random-string` with your preferred secret key.

### 2. Building URL

Use the provided script `build_url.exs` to build the URL:

```sh
./build_url.exs 'https://example.com/' \
  '{"method": "get", "url": "http://watchtower:8080/v1/update", "headers": {"Authorization": "Bearer secret-token"}}'
```

Replace the example URLs and tokens with your actual endpoints and authentication details.

### 3. Integration

Once you have the built URL, integrate it with your preferred CI/CD service, such as GitHub Actions, Jenkins, or GitLab CI, to trigger the desired actions based on events.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
