# Image Server

This is a project for testing the use of RIIIF as the next image server for DLSS.

## Testing

```
rake test
```

## Caching

In development mode, to enable caching run:

```
touch tmp/caching-dev.txt
```

To disable caching:
```
rm tmp/caching-dev.txt
```
