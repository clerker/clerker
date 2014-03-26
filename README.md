# Clerker for Stripe

[![Build Status](https://travis-ci.org/clerker/clerker.svg?branch=master)](https://travis-ci.org/clerker/clerker)

[Clerker](http://www.clerker.io) is an open-source micro-service
that provides some common useful functionality for Stripe users.
The functionality includes:

* **Vouchers:** Generate, distribute, and manage redemption of
  account credit vouchers. Vouchers grant simple account credit
  and do not conflict with Stripe's existing coupon system.
* **Card Update:** Easily capture new card information when a
  user's card is declined or expired.
* **One-Off Payments:** Do you need a one-off payment from a
  customer due to unusual circumstances? Collect it easily
  with Clerker's one-off payment system.

Best of all, Clerker is designed such that all of these actions can
be performed with minimal integration work and may be integrated into
static web applications as well.

## Getting Started

Clerker is designed to work both as a single-tenant and multi-tenant
application. For single-tenant, the following environment variables
must be set:

```
ACCOUNT_NAME="Name of Your Company"
ACCOUNT_EMAIL="support@yourcompany.com"
ACCOUNT_SECRET=___SOME_UNGUESSABLE_SECRET___
STRIPE_SECRET_KEY=sk_YOUR_STRIPE_SK
STRIPE_PUBLISHABLE_KEY=pk_YOUR_STRIPE_PK
DATABASE_URL=postgres://address-of-your-database
```

Note that for local development Clerker uses the [dotenv](https://github.com/bkeepers/dotenv)
library so any environment variables set in `.env` will be loaded
appropriately.

Once you have configured environment variables properly, you will need to
properly create, migrate, and seed the database:

```
bundle install
bundle exec rake db:create db:migrate db:seed
```

