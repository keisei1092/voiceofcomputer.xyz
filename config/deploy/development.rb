set :stage, :development
role :app, %w{root@157.7.53.185}
role :web, %w{root@157.7.53.185}
role :db, %w{root@157.7.53.185}

server '157.7.53.185',
user: 'root',
roles: %w{web app db},
ssh_options: {
 auth_methods: %w(password),
 password: 'Q4Uodoh5dCcfapX1'
}