package com.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 *
 */
@Aspect
@Component
public class LogAopAction {
    Logger logger = LoggerFactory.getLogger(LogAopAction.class);


    @Pointcut("execution(public * com.service..*.update(..))")
    public void saveLog(){}

    @Pointcut("execution(public * com.service..*.delete(..))")
    public void deleteLog(){}


    @Before("saveLog()||deleteLog()")
    public void doBefore(JoinPoint point)  throws Throwable{

        logger.info("@Before：模拟目标方法前...");
        logger.info("@Before：目标方法为：" +
                point.getSignature().getDeclaringTypeName() +
                "." + point.getSignature().getName());
        logger.info("@Before：参数为：" + Arrays.toString(point.getArgs()));
        logger.info("@Before：被织入的目标对象为：" + point.getTarget());
    }


}