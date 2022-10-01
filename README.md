# Tutorial For Workshop SANDEC - Magic of GetX For Flutter

A new Flutter project.

## Getting Started

1. Import database to your localhost [FILE](https://github.com/hanifabdullah21/sandec_magic_of_getx/blob/main/db_sandec_magic_of_getx.sql)
2. Extract Laravel Project [FILE](https://github.com/hanifabdullah21/sandec_magic_of_getx/blob/main/sandec_magic_of_getx_api.zip)
3. Run API
```
php -S YOUR_API:5000 -t public
```
4. Change BASE URL on file ApiProvider.dart
```
httpClient.baseUrl = "http://YOUR_API:5000";
```
5. Run the flutter project

For help getting started this tutorial [see](https://docs.google.com/presentation/d/1mgFvgcRA6zUvZ_glQancGEQveAR63t9jaF2qX856wSA/edit?usp=sharing)
