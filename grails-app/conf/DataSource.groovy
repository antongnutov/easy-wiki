dataSource {
    pooled = true
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

environments {
    development {
        dataSource {
            driverClassName = "org.h2.Driver"
            username = "sa"
            password = ""
            dbCreate = "create-drop"
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    test {
        dataSource {
            driverClassName = "org.h2.Driver"
            username = "sa"
            password = ""
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            // will be overridden by cloud foundry
            dialect= org.hibernate.dialect.MySQLInnoDBDialect
            driverClassName = "com.mysql.jdbc.Driver"
            username = "n/a"
            password = "n/a"
            url = 'jdbc:mysql://localhost/easy-wiki-db?useUnicode=true&characterEncoding=utf8'
            dbCreate = "update"
        }
    }
    jelastic {
        dataSource {
            driverClassName = "org.h2.Driver"
            username = "sa"
            password = ""
            url = "jdbc:h2:database/easy-wiki;MVCC=TRUE;LOCK_TIMEOUT=10000"
            dbCreate = "update"
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}
