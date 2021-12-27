class SsoDetail < ConfigSetting

  store :config_value, coder: JSON, accessors: [
    :sso_provider,
    :tenant_id,
    :email_domains
  ]

end