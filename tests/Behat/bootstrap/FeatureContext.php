<?php

declare(strict_types=1);

namespace Tests\Behat\bootstrap;

use Behat\Behat\Context\Context;

class FeatureContext implements Context
{
    /**
     * @Given I have Behat properly configured
     */
    public function iHaveBehatProperlyConfigured()
    {
    }

    /**
     * @Then it should run this test successfully
     */
    public function itShouldRunThisTestSuccessfully()
    {
    }
}
