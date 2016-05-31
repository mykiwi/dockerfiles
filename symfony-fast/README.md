# Pick one version then

- follow the install instructions of [M6Web/PhpProcessManagerBundle](https://github.com/M6Web/PhpProcessManagerBundle) in your Symfony application
    - `composer require m6web/php-process-manager-bundle`
    - add in AppKernel.php: `new M6Web\Bundle\PhpProcessManagerBundle\M6WebPhpProcessManagerBundle(),`
- `docker-compose up -d`
- `docker-compose scale php=5`
