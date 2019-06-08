package ddit.finalproject.team2;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@Transactional // 테스트 과정의 모든 데이터는 DB 에 반영하지 않도록..
public @interface RootWebConfiguration {

}
