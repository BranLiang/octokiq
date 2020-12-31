# Changelog

## 0.1.0 - 2020-12-29

Initial release 🚀

## 0.1.1 - 2020-12-30

- Replace worker class configuration `queue` with `octokiq_options`
- Enable non-ractor safe job running with traditional `Thread`

## 0.1.2 - 2020-12-30

- Fix the ractor server loop bug
- Add configuration `force_thread_mode`

## 0.1.3 - 2020-12-31

- Seperate `server` and `client` concerns