package com.wsyu.onlinebookstore.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("com.wsyu.onlinebookstore.controller")
@EnableWebMvc
public class MvcConfiguration implements WebMvcConfigurer {
//    @Override
//    //默认的Servlet处理静态资源
//    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//        configurer.enable();
//
//    }
    //配置视图解析器
    @Bean
    public InternalResourceViewResolver configureInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
//    @Override
//    //配置拦截器
//    public void addInterceptors(InterceptorRegistry registry) {
//        FirstInterceptor firstInterceptor = new FirstInterceptor();
//        registry.addInterceptor(firstInterceptor).addPathPatterns("/**");
//
//    }
//
//    //配置异常解析器
//    @Override
//    public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> resolvers) {
//        SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();
//        Properties properties = new Properties();
//        properties.setProperty("java.lang.ArithmeticException","error");
//        exceptionResolver.setExceptionMappings(properties);
//        exceptionResolver.setExceptionAttribute("ex");
//        resolvers.add(exceptionResolver);
//    }
}
