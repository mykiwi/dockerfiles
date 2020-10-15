# Phaudit

- [`7.3`, `latest` (*phaudit/7.3/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/phaudit/7.3/Dockerfile)
- [`7.2` (*phaudit/7.2/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/phaudit/7.2/Dockerfile)
- [`7.1` (*phaudit/7.1/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/phaudit/7.1/Dockerfile)
- [`7.0` (*phaudit/7.0/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/phaudit/7.0/Dockerfile)

A simple docker images to run some phpqatools on your php project

## Available tools

* [NoVerify](https://github.com/VKCOM/noverify) as `noverify`
* [PHPLoc](http://github.com/sebastianbergmann/phploc) as `phploc`
* [PHP_Depend](http://pdepend.org/) as `pdepend`
* [Phan](https://github.com/phan/phan) as `phan`
* [PHP Mess Detector](http://phpmd.org/) as `phpmd`
* [PHP_CodeSniffer](http://pear.php.net/PHP_CodeSniffer) as `phpcs` and `phpcbf`
* [PHP Copy/Paste Detector](http://github.com/sebastianbergmann/phpcpd) as `phpcpd`
* [PHP Dead Code Detector](http://github.com/sebastianbergmann/phpdcd) as `phpdcd`
* [PhpMetrics](http://www.phpmetrics.org/) as `phpmetrics`
* [PHP Coding Standards Fixer](http://cs.sensiolabs.org/) as `php-cs-fixer`
* [PHP Static Analysis Tool](https://github.com/phpstan/phpstan) as `phpstan`
* [Security Checker](https://security.symfony.com/) as `security-checker`
* [Twig Coding Standards](https://github.com/friendsoftwig/twigcs) as `twigcs`
* [YAML Linter](https://github.com/HeahDude/yaml-linter) as `yaml-linter`
* [PhpCodeFixer](https://github.com/wapmorgan/PhpCodeFixer) as `phpcf`

## Usage

Grab the image, and run one of tool with your project mounted in the work directory `/project` on this image:

```
cd my_php_project
docker pull mykiwi/phaudit
docker run -t -i -v `pwd`:/project mykiwi/phaudit phploc src/
```

---

Adapted from [jolicode/phaudit](https://hub.docker.com/r/jolicode/phaudit/)
