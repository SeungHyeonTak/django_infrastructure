# Django 인프라 샘플 프로젝트

## 적용해볼 내용

### Docker

#### Dockerfile

Docker 컨테이너 안에서 해당 애플리케이션이 돌아갈 수 있는 환경을 이미지(image)를 떠 놓아야한다.

이미지를 떠 놓으면 개발자들이 프로젝트를 셋팅할때 번거로운 사전 세팅을 생략하고 바로 해다 이미지를 컨테이너 안에서 실행 할 수 있다.

Dockerfile은 Docker 이미지 빌드 될때 거쳐야하는 단계를 정의하고 있는 텍스트 파일이다.

일단, 최상위 경로에 Dockerfile을 생성하고 그 안에 내용을 입력하자.

**Dockerfile**

```Dockerfile
FROM python:3.9.5
ENV PYTHONUNBUFFERED 1
WORKDIR /django_Infrastructure
COPY . .
RUN apt-get update
RUN pip install -r requirements.txt
EXPOSE 8000
```

- FROM python:3.9.5
  - 도커 허브에서 해당 python version의 이미지를 기반으로 두고 이미지를 만들겠다는 뜻이다.
  - Dockerfile로 이미지를 생성할 때는 항상 기존에 있는 이미지를 기반으로 새 이미지를 만들기 때문에 FROM은 반드시 설정해야한다.
  - 태그를 붙이지 않는다면 latest가 자동으로 선택된다.
- ENV PYTHONUNBUFFERED 1
  - 이미지 내 `PYTHONUNBUFFERED` 환경 변수를 `1`로 설정
- WORKDIR /django_Infrastructure
  - 이미지 내 작업 디렉터리를 `/django_Infrastructure` 로 변경
- COPY . .
  - 현재 디렉터리의 모든 파일을 이미지 내의 작업 디렉터리로 복사
- RUN apt-get update
- RUN pip install -r requirements.txt
  - pip를 이용해서 이미지 안에 패키지 설치
- EXPOSE 8000
  - 호스트와 연결할 포트 번호를 설정해 준다.

**Docker image 생성**

```shell
$ docker build -t [생성하고자 하는 도커 이미지 이름] .
$ docker images # docker images 확인
```

**Docker run**

- 제대로 실행되는지 테스트 해보기 위해 실행시켜서 확인한다.

docker run -p [호스트포트]:[컨테이너포트] [생성한 이미지 이름]

```shell
$ docker run -p 8000:8000 mason/docker_example
```

백그라운드 실행

```shell
$ docker run -d -p 8000:8000 mason/docker_example
```

**docker-compose.yml**

```yaml
version: "3"

services: 
    web: 
      
```

### CI/CD (AWS 파이프 라인)

### Celery