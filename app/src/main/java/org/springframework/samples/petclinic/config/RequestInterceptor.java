package org.springframework.samples.petclinic.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Component
public class RequestInterceptor implements HandlerInterceptor {

	private final Logger logger = LoggerFactory.getLogger(RequestInterceptor.class);

	private static List<String> allowedUrls;

	private static final int MAX_LATENCY_TO_ADD_MS = 140;
	private static final int MIN_LATENCY_TO_ADD_MS = 15;

	public RequestInterceptor() {
		// Add URLs which we will NOT add extra latency to. All other incoming requests will have artifiical latency
		allowedUrls = new ArrayList<>();
		allowedUrls.add("resources");
		allowedUrls.add("webjars");
		allowedUrls.add("actuators");
		allowedUrls.add("prometheus");
	}

	// Intercepts every request
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response,
							 Object handler) throws InterruptedException {

		// Add artificial latency to some requests so make it
		// easier to create latency SLOs
		boolean urlIsAllowed = false;

		for (String allowedUrl : allowedUrls) {

			if (request.getRequestURI().toLowerCase().contains(allowedUrl.toLowerCase())) {
				// Don't add latency to the request
				urlIsAllowed = true;
			}
		}

		if (!urlIsAllowed) {
			int latencyToAdd = new Random()
				.nextInt(MAX_LATENCY_TO_ADD_MS - MIN_LATENCY_TO_ADD_MS) + MIN_LATENCY_TO_ADD_MS;

			Thread.sleep(latencyToAdd);
		}

		return true;
	}


}
