package com.wsyu.onlinebookstore.initializer;

import com.wsyu.onlinebookstore.config.MainConfiguration;
import com.wsyu.onlinebookstore.config.MvcConfiguration;
import com.wsyu.onlinebookstore.config.MybatisConfiguration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{MainConfiguration.class, MybatisConfiguration.class};
    }
    
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{MvcConfiguration.class};
    }
    
    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
