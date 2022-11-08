resource "aws_cloudfront_distribution" "CloudFrontDistribution" {
  aliases=["www.${var.HostedZoneName}"]
  comment="www.${var.HostedZoneName}"
  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = []
    compress= true
    default_ttl = 0
    forwarded_values {
      headers                = ["*"]
      query_string           = true
      query_string_cache_keys= []
      cookies {
        forward          = "all"
        whitelisted_names= []
      }
    }
    max_ttl=0
    min_ttl=0
    smooth_streaming = false
    target_origin_id       = "elb"
    viewer_protocol_policy = "redirect-to-https"
  }
  enabled = true
  is_ipv6_enabled=true
  http_version="http2and3"
  ordered_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = []
    compress= true
    default_ttl = 900
    forwarded_values {
      headers                = ["Host"]
      query_string           = true
      query_string_cache_keys= []
      cookies {
        forward="none"
      }

    }
    max_ttl=900
    min_ttl=900
    path_pattern="wp-includes/*"
    smooth_streaming = false
    target_origin_id       = "elb"
    viewer_protocol_policy = "redirect-to-https"
  }
  ordered_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = []
    compress= true
    default_ttl = 900
    forwarded_values {
      headers                = ["Host"]
      query_string           = true
      query_string_cache_keys= []
      cookies {
        forward="none"
      }

    }
    max_ttl=900
    min_ttl=900
    path_pattern="wp-content/*"
    smooth_streaming = false
    target_origin_id       = "elb"
    viewer_protocol_policy = "redirect-to-https"
  }
  origin {
    domain_name = var.HostedZoneName
    origin_id   = "elb"
    custom_origin_config{
      http_port=0
      https_port=0
      origin_protocol_policy="https-only"
      origin_ssl_protocols=[]
      origin_read_timeout=60
    }
  }
  price_class="PriceClass_All"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate=false
    minimum_protocol_version= "TLSv1"
    ssl_support_method      = "sni-only"
  }
}
