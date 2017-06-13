package runnerAndSteps;

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.sql.DriverManager;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

import org.junit.AfterClass;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import com.Gessit.Gessit_AddPatientPage;
import com.Gessit.Gessit_LandingPage;
import com.TSSPages.AccountFinancialHistorypage;
import com.TSSPages.BillingHistoryPage;
import com.TSSPages.DBUtilities;
import com.TSSPages.ForgotYourPasswordPage;
import com.TSSPages.GoalsAndTargetsPage;
import com.TSSPages.HomePage;
import com.TSSPages.LandingPage;
import com.TSSPages.MakeAPaymentPage;

import cucumber.api.DataTable;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Gessit_StepImplementations {
	// ********************************************** following is before and
	// after *****************************************
	WebDriver driver;
	private String bolt;
	static String CapturedValue;
	
//	//cons
//	Gessit_StepImplementations(String CapturedValue)
//	{
//		this.CapturedValue = CapturedValue;
//	}

	@Before()
	public void startUp() {
		// driver = new FirefoxDriver();
		// driver.manage().window().maximize();

		// the location of the driver is been changed to match with remote
		// server setting..... HS
		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\chromedriver.exe");

		// following is added to fix chrome maximise issue

		ChromeOptions options = new ChromeOptions();
		options.addArguments("test-type");
		options.addArguments("start-maximized");
		options.addArguments("--js-flags=--expose-gc");
		options.addArguments("--enable-precise-memory-info");
		options.addArguments("--disable-popup-blocking");
		options.addArguments("--disable-default-apps");
		options.addArguments("test-type=browser");
		options.addArguments("disable-infobars");

		driver = new ChromeDriver(options);

		// driver = new ChromeDriver();

		// driver.manage().window().maximize();

	}
	// **************disable to leave browser
	// open***************************************

	@After()
	public void tearDown() {
		// driver.quit();
	}
	// ******************************************************************************

	// for Chrome driver
	// System.setProperty("webdriver.chrome.driver", "C:\\Program
	// Files\\Automation Tools\\Drivers\\chromedriver.exe");
	// driver = new ChromeDriver();
	// driver.manage().window().maximize();

	// for IE
	// System.setProperty("webdriver.chrome.driver", "C:\\Program
	// Files\\Automation Tools\\Drivers\\IEDriverServer.exe");
	// driver = new ChromeDriver();
	// driver.manage().window().maximize();

	// *****************************************************following are
	// steps******************************************

	// ********************************************************************************************************************************
	// **************************************** Capture element from
	// Page************************************************************

	@Given("^I capture \"(.*?)\"$")
	public String i_capture(String arg1) throws Throwable {

		// DBUtilities createXpath = new DBUtilities(driver);
		// String myxpath = createXpath.xpathMakerById(arg1);
		// System.out.println(myxpath);
		//
		// WebElement xyz = driver.findElement(By.xpath(myxpath));
		//
		// //Gessit_StepImplementations.Capture= xyz.getText();
		// //In a textbox typed text goes into the value attribute so
		// Gessit_StepImplementations.Capture= xyz.getAttribute(arg1);
		// System.out.println("object that is captured is
		// *****************>>>>>>>>>>>>>>>>>>>>>>>> " +Capture);

		DBUtilities createXpath = new DBUtilities(driver);
		
		String myxpath = createXpath.xpathMakerById(arg1);
		Gessit_StepImplementations.CapturedValue = driver.findElement(By.xpath(myxpath)).getAttribute("value");
		System.out.println("object that is captured is *****************>>>>>>>>>>>>>>>>>>>>>>>> " + CapturedValue);

		return CapturedValue;

	}

	@Given("^I paste \"(.*?)\"$")
	public void i_paste(String arg1) throws Throwable {
		// System.out.println(Gessit_StepImplementations.CapturedValue2);
		// System.out.println(Gessit_StepImplementations.CapturedValue2);
		// String htmlToBePasted = Gessit_StepImplementations.CapturedValue2;
		// System.out.println(htmlToBePasted);
		// driver.findElement(By.xpath("//*[contains(@id,
		// 'inputemail')]")).click();
		// driver.findElement(By.xpath("//*[contains(@id,
		// 'inputemail')]")).sendKeys(htmlToBePasted);

		System.out.println(Gessit_StepImplementations.CapturedValue);
		String htmlToBePasted = Gessit_StepImplementations.CapturedValue;
		System.out.println(htmlToBePasted);
//		driver.findElement(By.xpath("//*[contains(@id, 'inputemail')]")).click();
//		driver.findElement(By.xpath("//*[contains(@id, 'inputemail')]"))
//				.sendKeys(Gessit_StepImplementations.CapturedValue);
		DBUtilities createXpath = new DBUtilities(driver);
		String myXpath = createXpath.xpathMakerById(arg1);
		driver.findElement(By.xpath(myXpath)).sendKeys(Gessit_StepImplementations.CapturedValue);
	}

	@And("^I click on captured \"(.*?)\"$")
	public void i_click_on_captured(String arg1) throws Throwable {
		System.out.println(Gessit_StepImplementations.CapturedValue);
		String htmlToBePasted = Gessit_StepImplementations.CapturedValue;
		DBUtilities createXpath = new DBUtilities(driver);
		String myXpath = createXpath.xpathMaker(htmlToBePasted);
		WebElement some_element = driver.findElement(By.xpath(myXpath));
		System.out.println("clicking on element captured " +some_element);
		some_element.click();


	}
	@Then("^I check \"(.*?)\" is not readonly$")
	public void i_check_is_not_readonly(String arg1) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myXpath = createXpath.xpathMakerById(arg1);
		Thread.sleep(1000);
		WebElement some_element = driver.findElement(By.xpath(myXpath));
		// some_element.click();
		Assert.assertTrue(some_element.isEnabled());
	}

	// to check if astrick is present on a mandatory field
	@Given("^I check \"(.*?)\" is marked as \"(.*?)\"$")
	public void i_check_is_marked_as(String arg1, String arg2) throws Throwable {
		String myxpath = new DBUtilities(driver).xpathMakerById(arg1);
		WebElement elementName = driver.findElement(By.xpath(myxpath));
		System.out.println(elementName);
		String myxpath2 = new DBUtilities(driver).xpathMakerByTextInClass(arg2);

		// following is generating a combined xpath and then looking for element
		String combineXPaths = new DBUtilities(driver).combine2Xpaths(myxpath, myxpath2);
		System.out.println(combineXPaths);
		WebElement elementName2 = driver.findElement(By.xpath(combineXPaths));
		System.out.println(elementName2);
		Assert.assertTrue(elementName2.isDisplayed());

	}

	@Then("^I check \"(.*?)\" contains \"(.*?)\"$")
	public void i_Check_contains(String arg1, String arg2) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		Thread.sleep(3000);
		// System.out.println(myxpath);
		// String elementToBeSearched = StepImpe.Capture;
		// System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
		// +elementToBeSearched);
		// DBUtilities t1 = new DBUtilities(driver);
		// t1.isTextPresent(elementToBeSearched);
		WebElement inputBox = driver.findElement(By.xpath(myxpath));
		String boxContents = inputBox.getAttribute("value");
		System.out.println("boxContents: " + boxContents);
		System.out.println("arg2: " + arg2);

		try {
			Assert.assertTrue(boxContents.equals(arg2));
		} catch (AssertionError e) {
			// for input fields that default to the placeholder value when empty
			// (very specific ones)
			e.printStackTrace();
			System.out.println("Attempting to search for placeholder...");
			boxContents = inputBox.getAttribute("placeholder");
			System.out.println("boxContents: " + boxContents);
			System.out.println("arg2: " + arg2);
			Assert.assertTrue(boxContents.equals(arg2));
		}
		boxContents = null;
		inputBox = null;
		Thread.sleep(2000);

	}

	@Then("^I check \"(.*?)\" is empty$")
	public void i_check_is_empty(String arg1) throws Throwable {
		String myxpath = new DBUtilities(driver).xpathMakerById(arg1);
		WebElement inputBox = driver.findElement(By.xpath(myxpath));
		Assert.assertTrue(inputBox.isDisplayed());
		String boxContents = inputBox.getAttribute("value");
		Assert.assertTrue(boxContents.isEmpty());
	}

	// *************************************************************************************************************************

	@Given("^I want to login to portal \"(.*?)\"$")
	public void i_want_to_login_to_portal(String arg1) throws Throwable {
		HomePage home = PageFactory.initElements(driver, HomePage.class);
		home.navigateTo(arg1);

	}

	@And("^I hit Enter$")
	public LandingPage I_hit_Enter() throws InterruptedException {
		PageFactory.initElements(driver, LandingPage.class).hitEnter();
		Thread.sleep(1000);

		return PageFactory.initElements(driver, LandingPage.class);
	}

	@And("^I hit tab$")
	public LandingPage I_hit_Tab() throws InterruptedException {
		PageFactory.initElements(driver, LandingPage.class).hitTab();
		Thread.sleep(1000);

		return PageFactory.initElements(driver, LandingPage.class);
	}

	// will be used to tab out to activate a button incase the button is not
	// activated.
	@Given("^I Tab Out$")
	public void i_Tab_Out() throws Throwable {
		new DBUtilities(driver).tabOut();
	}

	@Then("^I click on image \"(.*?)\"$")
	public void i_click_on_image(String arg1) throws Throwable {
		try {
			driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
			LandingPage lp = PageFactory.initElements(driver, LandingPage.class);
			String imgToBeClicked = PageFactory.initElements(driver, Gessit_AddPatientPage.class).clickOnImage(arg1);
			// lp.clickOnImage(arg1);
			WebElement exist = driver.findElement(By.xpath(imgToBeClicked));
			exist.click();
		} catch (Exception e) {
			System.out.println("Shori saab, Element image not visible on Screen");
		}
	}

	// click on text
	@Then("^I click on text \"(.*?)\"$")
	public void i_click_on_text(String arg1) throws Throwable {
		if (arg1.equals("Request Referral to Liver Clinic")) {
			String txtToBeClicked = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerContainsText2ndOption(arg1);
			WebElement exist = driver.findElement(By.xpath(txtToBeClicked));
			exist.click();
		} else {
			String txtToBeClicked = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerContainsText(arg1);
			WebElement exist = driver.findElement(By.xpath(txtToBeClicked));
			exist.click();
		}
	}

	@And("^I click on button \"(.*?)\"$")
	public void i_click_on_button(String arg1) throws Throwable {
		Thread.sleep(1000);
		Pattern datePattern = Pattern.compile("\\d\\d\\d\\d\\d\\d\\d\\d"); // date
																			// pattern
																			// as
																			// used
																			// in
																			// the
																			// calendar
																			// popup
		String myXpath = null;
		DBUtilities createXpath = new DBUtilities(driver);
		if (datePattern.matcher(arg1).matches()) {
			myXpath = createXpath.xpathMakerContainsCustomField("dyc-date", arg1);
			try {
				driver.findElement(By.xpath(myXpath)).click();
			} catch (Exception e) {
				for (int i = 0; i < 100; i++) {
					System.out.println("(" + myXpath + ")[" + i + "]");
					try {
						driver.findElement(By.xpath("(" + myXpath + ")[" + i + "]")).click();
						break;
					} catch (Exception e2) {
						System.out.println();
					}
				}

			}
		}

		else {
			myXpath = createXpath.xpathMakerById(arg1);
			WebElement exist = driver.findElement(By.xpath(myXpath));
			System.out.println(exist.getText());
			((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", exist);
			exist.click();

		}

		Thread.sleep(2500);

	}

	@And("^I scroll \"(.*?)\" the page$")
	public void i_scroll_the_page(String arg1) throws Throwable {
		new DBUtilities(driver).scrollDownThePage(arg1);
	}

	
	
	@And("^I click on \"(.*?)\"$")
	public void i_click_on(String arg1) throws Throwable {
		// give time for page loading

		if (arg1.equals("Create New Patient") || (arg1.equals("Care Units")))

		{
			Thread.sleep(3000);
			DBUtilities createXpath2 = new DBUtilities(driver);
			String myxpath = createXpath2.xpathMakerContainsText(arg1);
			System.out.println("cliclking on " + myxpath);
			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
			driver.findElement(By.xpath(myxpath)).click();

		}

		else if (arg1.equals("Welcome")) {
			DBUtilities createXpath2 = new DBUtilities(driver);
			String myxpath3 = createXpath2.xpathMakerContainsText(arg1);

		}

		else {
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMaker(arg1);
			// createXpath.scrollDownForElement(myxpath);
			System.out.println("cliclking on " + myxpath);

			if (driver.findElement(By.xpath(myxpath)).isDisplayed()) {
				System.out.println("Element is Present" + myxpath);
			} else {
				System.out.println("Element is Absent SOOOOOO SCROLLING DOWN" + myxpath);
				createXpath.scrollDownForElement(myxpath);
			}
			Thread.sleep(1000);

			driver.findElement(By.xpath(myxpath)).click();

		}
		Thread.sleep(1000);

	}

	
	
	// ****************************************************

	// this is for pop-up only

	// *********************************************************
	@And("^I click on \"(.*?)\" on popup$")
	public void i_click_on_popup(String arg1) throws Throwable {
		// give time for page loading

		if (arg1.equals("agreeButton")) {
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMakerByExactId(arg1);
			System.out.println("cliclking on popup" + myxpath);
			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
			Thread.sleep(1000);
			driver.findElement(By.xpath(myxpath)).click();
		} else {

			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMakerById(arg1);
			System.out.println("cliclking on popup" + myxpath);
			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
			Thread.sleep(1000);
			driver.findElement(By.xpath(myxpath)).click();

			Thread.sleep(1000);
		}
	}

	@Given("^I enter popup values as$")
	public void i_enter_popup_values_as(DataTable table) throws Throwable {
		PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);

	}

	// only in emergency as gessit has some pop up values that has duplicates
	// thanks to poor programming practices

	@Given("^I enter pop field \"(.*?)\" as \"(.*?)\"$")
	public void i_enter_pop_field_as(String arg1, String arg2) throws Throwable {
		String myxpath = PageFactory.initElements(driver, DBUtilities.class).clickOn2ndOptionOnPopup(arg1);
		driver.findElement(By.xpath(myxpath)).sendKeys(arg2);

	}

	// for drop down
	

		@Given("^I select \"(.*?)\" from \"(.*?)\"$")
		public void i_select_from(String arg1, String arg2) throws Throwable {
		
//				String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById1AndId2(arg1, arg2);
//				driver.findElement(By.xpath(myxpath)).click();
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerContainsText(arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg2);
			System.out.println(" looking for dropdown xpath " +myxpath);
			if (myxpath.equals("//*[contains(text(),'')]")){
			//donothing
				
			}else if (arg1.equals("Pegasys (peginterferon alfa-2a )")){
			
				  Select dropdown = new Select(driver.findElement(By.xpath(myxpath)));
				  dropdown.selectByValue(arg1);
			}else{
				driver.findElement(By.xpath(myxpath2)).click();
				Thread.sleep(1000);
				driver.findElement(By.xpath(myxpath)).click();

			}
			System.out.println();
			
		}
	

	// same as above BUT this is for pop up as multiple elements detected.
	@Then("^on popup I select \"(.*?)\" from \"(.*?)\"$")
	public void on_popup_I_select_from(String arg1, String arg2) throws Throwable {
		String myXpath = PageFactory.initElements(driver, DBUtilities.class).xpathMakerByExactId(arg2);
		WebElement clickOn = driver.findElement(By.xpath(myXpath));
		clickOn.click();
		PageFactory.initElements(driver, DBUtilities.class).hitDown();
		PageFactory.initElements(driver, DBUtilities.class).hitEnter();

	}

	// check for field text and text boxes
	@And("^I enter the details as$")
	public void I_enter_then_details_as(DataTable table) throws Throwable {

		PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);
		// In test
		Thread.sleep(2000);

	}

	// simple wait
	@Then("^I wait for \"(.*?)\" millisecond$")
	public void i_wait_for_millisecond(long arg1) throws Throwable {
		Thread.sleep(arg1);

	}

	// @And("^I enter then details as new$")
	// public void enterCucumberTableValuesInUI(DataTable table) throws
	// InterruptedException{
	// PageFactory.initElements(driver,
	// DBUtilities.class).enterCucumbertableValuesInUI(table);
	//
	// }

	@Then("^I hover on \"(.*?)\" to verify \"(.*?)\" is displayed$")
	public void i_hover_on_to_verify_is_displayed(String arg1, String arg2) throws Throwable {
		PageFactory.initElements(driver, MakeAPaymentPage.class).hoverOverElement(arg1, arg2);

	}

	// Specifically for Gessit datepicker
	@Then("^I use \"(.*?)\" to enter \"(.*?)\"$")
	public void i_use_to_enter(String arg1, String arg2) throws Throwable {
		String myxpath = PageFactory.initElements(driver, DBUtilities.class).xpathMakerById(arg1);
		WebElement date = driver.findElement(By.xpath(myxpath));

		Actions actions = new Actions(driver);
		actions.moveToElement(date);
		actions.click();
		actions.sendKeys(arg2);
		actions.build().perform();

	}

	// CHECK ELEMENT IS READ ONLY
	@Then("^I check \"(.*?)\" is readonly$")
	public void i_check_is(String arg1) throws Throwable {
		PageFactory.initElements(driver, DBUtilities.class).elementIsreadOnly(arg1);
	}

	// this is for checking checkbox
	@Given("^I click on \"(.*?)\" checkbox$")
	public void i_click_on_checkbox(String arg1) throws Throwable {

		PageFactory.initElements(driver, ForgotYourPasswordPage.class).checkBoxClick(arg1);

	}

	// *********************************************** read popup
	// message********************************************
	@Then("^I see \"(.*?)\" displayed on popup and I click \"(.*?)\"$")
	public void i_see_displayed_on_popup_and_I_click(String arg1, String arg2) throws Throwable {
		Thread.sleep(2000);
		PageFactory.initElements(driver, DBUtilities.class).checkPopUpMessage(arg1);
		PageFactory.initElements(driver, DBUtilities.class).clickOnPopUP(arg2);

	}

	// ***************************************************Landing
	// Page********************************************************
	@Then("^\"(.*?)\" is displayed as \"(.*?)\"$")
	public void is_displayed_as(String arg1, String arg2, DataTable table) throws Throwable {

		PageFactory.initElements(driver, LandingPage.class).checkElementPresentOnScreen(table);
	}
	// }

	// this is for item link

	@Then("^\"(.*?)\" link is displayed as \"(.*?)\"$")
	public void link_is_displayed_as(String arg1, String arg2, DataTable table) throws Throwable {

		PageFactory.initElements(driver, LandingPage.class).checkElementLinkPresentOnScreen(table);
	}
	// }

	@Then("^\"(.*?)\" is NOT displayed as \"(.*?)\"$")
	public void is_not_displayed_as(String arg1, String arg2, DataTable table) throws Throwable {
		PageFactory.initElements(driver, LandingPage.class).checkTextElementAbsent(table);
	}

	// Read All SAs
	@Then("^I read all \"(.*?)\" from the corousel$")
	public void i_read_all_from_the_corousel(String arg1) throws Throwable {
		PageFactory.initElements(driver, LandingPage.class).selectSAsFromCorousel(arg1);

	}

	// ******************************************************* new page is
	// launched*********************************************
	@Then("^a new page \"(.*?)\" is launched$")
	public void a_new_page_is_launched(String arg1) throws Throwable {
		String URL = driver.getCurrentUrl();
		System.out.println(URL);
		new DBUtilities(driver).passControlToNewWindow(arg1);

	}

	@Then("^I will see message \"(.*?)\"$") // this is just a workaround for the
											// temp para coming in
	public void i_will_see_message(String arg1) throws Exception {

		Assert.assertTrue(driver.findElement(By.xpath("//*[contains(text(),arg1)]")).isDisplayed());
		System.out.println("Message sucessfully displayed as " + arg1);
		Thread.sleep(5000);
	}

	@When("^I view the left hand panel of screen$")
	public void i_view_the_left_hand_panel_of_screen() throws Throwable {
		System.out.println("Checking UI Elements on LHS of screen");
		Thread.sleep(10000);
	}

	@Then("^I see \"(.*?)\" displayed$")
	public void i_see_and_displayed(String arg1) throws Throwable {
		PageFactory.initElements(driver, LandingPage.class).checkUIElementIsDisplayed(arg1);

	}

	@Then("^I see text \"(.*?)\" displayed$")
	public void i_see_text_displayed(String arg1) throws Throwable {
		// Gessit_LandingPage AU = PageFactory.initElements(driver,
		// Gessit_LandingPage.class);
		// Thread.sleep(1000);
		// AU.checkUIElementTEXTIsDisplayed(arg1);
		DBUtilities createXpath = new DBUtilities(driver);
		createXpath.checkTextElementPresent(arg1);
	}

	@Then("^I see popup \"(.*?)\" displayed$")
	public void i_see_popup_displayed(String arg1) throws Throwable {
		// Gessit_LandingPage AU = PageFactory.initElements(driver,
		// Gessit_LandingPage.class);
		// Thread.sleep(1000);
		// AU.checkUIElementTEXTIsDisplayed(arg1);
		DBUtilities createXpath = new DBUtilities(driver);
		createXpath.xpathMakerById(arg1);
	}

	@Then("^I see text \"(.*?)\" not displayed$")
	public void i_see_text_not_displayed(String arg1) throws Throwable {
		// Gessit_LandingPage AU = PageFactory.initElements(driver,
		// Gessit_LandingPage.class);
		// Thread.sleep(1000);
		// AU.checkUIElementTEXTIsDisplayed(arg1);
		DBUtilities createXpath = new DBUtilities(driver);
		createXpath.checkTextElementAbsent(arg1);
	}

	// check i am on right page
	@Given("^I check I am on \"(.*?)\" page$")
	public void i_check_I_am_on_page(String arg1) throws Throwable {
		PageFactory.initElements(driver, BillingHistoryPage.class).checkIfOnRightPage(arg1);

		System.out.println(" on correct page " + arg1);
	}

	@Then("^I see sytem date displayed in \"(.*?)\"$")
	public void i_see_sytem_date_displayed(String arg1) throws Throwable {
		String date = PageFactory.initElements(driver, BillingHistoryPage.class).date();
		String bodyText = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg1);
		String downValue = driver.findElement(By.xpath(bodyText)).getText();
		Assert.assertTrue("Text not found!", downValue.contains(date));
	}

	// check that a checkbox is checked
	@Then("^I see checkbox \"(.*?)\" as selected$")
	public void i_see_checkbox_as_selected(String arg1) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		System.out.println("Checking if checkbox " + myxpath + " has been selected.");
		Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isSelected());
	}

	@Then("^I see checkbox \"(.*?)\" as not selected$")
	public void i_see_checkbox_as_not_selected(String arg1) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		System.out.println("Checking if checkbox " + myxpath + " has not been selected.");
		Assert.assertFalse(driver.findElement(By.xpath(myxpath)).isSelected());
	}

	// check the dropdown displays expected
	@Then("^\"(.*?)\" displays \"(.*?)\" by default$")
	public void displays_by_default(String arg1, String arg2) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myXpath = createXpath.xpathMakerContainsText(arg2);
		WebElement dropdownValue = driver.findElement(By.xpath(myXpath));
		System.out.println(dropdownValue.getText());
		PageFactory.initElements(driver, AccountFinancialHistorypage.class).isTextPresent(arg2);

		// DBUtilities createXpath = new DBUtilities(driver);
		// String myxpath = createXpath.xpathMakerById(arg1);
		// WebElement dropdown = driver.findElement(By.xpath(myxpath));
		// Select mySelect = new Select(dropdown);
		//
		// String currentValue = mySelect.getFirstSelectedOption().getText();
		// Assert.assertTrue(currentValue.equals(arg2));

	}

	// ***************************************** GRAPH CHECKS
	// *********************
	@Then("^the graph for \"(.*?)\" is displayed$")
	public void the_graph_for_is_displayed(String arg1) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		driver.findElement(By.xpath(myxpath)).click();
	}

	// ******************************************Compare values on
	// screen*************************
	@Then("^I compare \"(.*?)\" to \"(.*?)\"$")
	public void i_compare_to(String arg1, String arg2) throws Throwable {
		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
		compareValues.compareValueOneToValueTwo(arg1, arg2);
	}

	// compare 2 values
	@Then("^I verify \"(.*?)\" is \"(.*?)\" then \"(.*?)\"$")
	public void i_verify_is_then(String arg1, String arg2, String arg3) throws Throwable {
		DBUtilities val1 = new DBUtilities(driver);
		String a = val1.xpathMakerById(arg1);
		String currentValue1 = driver.findElement(By.xpath(a)).getText();
		System.out.println(currentValue1);
		String b = val1.xpathMakerById(arg3);
		String currentValue2 = driver.findElement(By.xpath(b)).getText();
		System.out.println(currentValue2);

		DBUtilities compareAccountTotalToServiceTotal = new DBUtilities(driver);
		String result = compareAccountTotalToServiceTotal.compare2DollarValues(currentValue1, currentValue2);

		Assert.assertTrue(result.contains(arg2));

	}

	@Then("^I click on \"(.*?)\" radio option$")
	public void i_click_on_radio_option(String arg1) throws Throwable {

		// String myxpath = PageFactory.initElements(driver,
		// Gessit_AddPatientPage.class).xpathMakerById(arg1);
		// following is for Gessit only.....because of poor coding practice
		String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg1);
		// for overlapping

		// myXpath = createXpath.xpathMakerById(arg1);
		WebElement elementToBeClicked = driver.findElement(By.xpath(myxpath));
		System.out.println(elementToBeClicked.getText());
		if (driver.findElements(By.xpath(myxpath)).size() != 0) {
			System.out.println("Element is Present");
		} else {
			System.out.println("Element is Absent SOOOOOO SCROLLING DOWN");
			DBUtilities createXpath = new DBUtilities(driver);
			createXpath.scrollDownForElement(myxpath);
		}
		Thread.sleep(1000);
		elementToBeClicked.click();

		//
		//
		//
		// ((JavascriptExecutor)
		// driver).executeScript("arguments[0].scrollIntoView(true);", myxpath);
		// driver.findElement(By.xpath(myxpath)).click();
		// System.out.println(" Selecting radio option " +arg1);

	}

	@And("^I check my \"(.*?)\"$")
	public void i_check_my(String arg1) throws Throwable {
		LandingPage checkMail = PageFactory.initElements(driver, LandingPage.class);
		String myxpath = checkMail.xpathMakerByClass(arg1);
		WebElement elementToBeClicked =  driver.findElement(By.xpath(myxpath));
		elementToBeClicked.click();
		
		
		
	}
	@Then("^I compare \"(.*?)\" to \"(.*?)\" to check if variation is displayed correctly$")
	public void i_compare_to_to_check_if_variation_is_displayed_correctly(String arg1, String arg2) throws Throwable {
		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
		compareValues.compareValueOneToValueTwo(arg1, arg2);
	}

	// *****************************************************************************************
	// **********************************************PAYMENT
	// WINDOW*****************************
	// *****************************************************************************************
	@Then("^a new \"(.*?)\" window is open$")
	public void a_new_window_is_open(String arg1) throws Throwable {
		// to do... add test once bug is fixed.
	}

	// *****************************************************************************************
	// **********************************************DATA BASE
	// CONNECTION***********************
	// *****************************************************************************************

	@Given("^I want to connect to Webservice$")
	public void i_want_to_connect_to_Webservice() throws Throwable {

	}

	// *****************************************************************************************
	// **********************************************PDF FILE
	// ***********************
	// *****************************************************************************************

	@Then("^I see a pdf document with name \"(.*?)\" generated$")
	public void i_see_a_pdf_document_with_name_generated(String arg1) throws Throwable {
		System.out.println("Yes******************* pdf is open");
		// DBUtilities moveControlToNewWindow = new DBUtilities(driver);
		new DBUtilities(driver).passControlToNewWindow(arg1);

	}

	// *****************************************************************************************
	// **********************************************Verify Table Rows
	// ***********************
	// *****************************************************************************************

	@Then("^I verify the \"(.*?)\" count is \"(.*?)\" to \"(.*?)\"$")
	public void i_verify_the_count_is_to(String arg1, String arg2, int arg3) throws Throwable {
		PageFactory.initElements(driver, AccountFinancialHistorypage.class).readAndCompareTableRows(arg1, arg2, arg3);

	}

	// ******************************CRAP**********************************
	// @Given("^I copy and paste the html in \"(.*?)\"$")
	// public void i_copy_and_paste_the_html_in_CIChecker(String arg1) throws
	// Throwable {
	// String html = driver.getPageSource();
	// HomePage home = PageFactory.initElements(driver, HomePage.class);
	// home.navigateTo(arg1);
	// Thread.sleep(1000);
	// driver.findElement(By.xpath("//*[contains(text(),'Paste HTML
	// Markup')]")).click();
	// Thread.sleep(1000);
	// driver.findElement(By.xpath("//*[contains(@id,
	// 'checkpaste')]")).sendKeys(html);
	// Thread.sleep(3000);
	//
	//
	// }

	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// ****************************************************UAP
	// STEPS*************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************

	@Given("^I read the table on \"(.*?)\" page$")
	public void i_read_the_table_on_page(String arg1) throws Throwable {
		new DBUtilities(driver).readTableAndCaptureInString(arg1);
	}

	// @Then("^I see the table \"(.*?)\" displayed$")
	// public void i_see_the_table_displayed(String arg1) throws Throwable {
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkUIElementTableIsDisplayed(arg1);
	// }

	// @And("^I see the number of \"(.*?)\" table records displayed$")
	// public void i_see_the_number_of_table_records_displayed(String arg1)
	// throws Throwable {
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkNumberOfTableRecordsIsDisplayed(arg1);
	// }
	//
	// @Then("^I see header \"(.*?)\" is displayed as \"(.*?)\" in table
	// \"(.*?)\"$")
	// public void i_see_header_is_displayed_as_in_table(String arg1, String
	// arg2, String arg3, DataTable table) throws Throwable {
	//
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkTableHeadersOrder(arg3, table);
	// }
	//
	// @And("^I see records in \"(.*?)\" are sorted by \"(.*?)\" in alphabetical
	// order$")
	// public void i_see_records_in_are_sorted_by_in_alphabetical_order(String
	// arg1, String arg2) throws Throwable {
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkTableRecordsOrder(arg1, arg2);
	// }

	// @And("^I click on Edit of \"(.*?)\" record$")
	// public void i_click_on_Edit_of_record(String arg1) throws Throwable {
	// Thread.sleep(3000);
	// DBUtilities dbutilities = new DBUtilities(driver);
	// WebElement myEdit = dbutilities.getEditbyRowNumber(arg1);
	//
	// JavascriptExecutor executor = (JavascriptExecutor)driver;
	// executor.executeScript("arguments[0].scrollIntoView(true);",myEdit);
	// myEdit.click();
	// }
	// TO DO for Justin toget the button name done.....later remove this step
	// and use the generic step...
	@Then("^I click on the \"(.*?)\" button$")
	public void i_click_on_the_button(String arg1) throws Throwable {
		Thread.sleep(3000);
		DBUtilities dbutilities = new DBUtilities(driver);
		String myxpath = dbutilities.xpathMaker(arg1);
		WebElement mybutton = driver.findElement(By.xpath(myxpath));

		JavascriptExecutor executor = (JavascriptExecutor) driver;
		executor.executeScript("arguments[0].scrollIntoView(true);", mybutton);
		mybutton.click();
	}
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// ************************************************Gessit Trial
	// STEPS********************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************
	// **************************************************************************************************************************

	@Then("^I see the table \"(.*?)\" displayed$")
	public void i_see_the_table_displayed(String arg1) throws Throwable {
		PageFactory.initElements(driver, DBUtilities.class).checkUIElementTableIsDisplayed(arg1);
	}

	// @And("^I see the number of records are displayed in \"(.*?)\" table$")
	// public void i_see_the_number_of_records_are_displayed_in(String arg1)
	// throws Throwable {
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkNumberOfTableRecordsIsDisplayed(arg1);
	// }
	//

	// good example to convert string into webelement and vise versa
	@Then("^I \"(.*?)\" text \"(.*?)\" displayed in table \"(.*?)\"$")
	public void i_should_see_displayed_in_table(String arg1, String arg2, String arg3) throws Throwable {

		if (arg1.equals("check")) {
			String checkElementInTable = PageFactory.initElements(driver, DBUtilities.class)
					.xpathMakerPickTrTextInTableID(arg2, arg3);
			// Assert.assertEquals(true, checkElementInTable.isDisplayed());
			Assert.assertTrue(driver.findElement(By.xpath(checkElementInTable)).isDisplayed());

		} else if (arg1.equals("click")) {
			// PageFactory.initElements(driver,
			// DBUtilities.class).getTableRowContentByTableId(arg1,arg2,arg3);
			DBUtilities createXpath = new DBUtilities(driver);
			String checkElementInTable = createXpath.xpathMakerPickTrTextInTableID(arg2, arg3);
			System.out.println("clicking on table element " + arg1);
			driver.findElement(By.xpath(checkElementInTable)).click();

		}
	}

	@Then("^I see header \"(.*?)\" is displayed as \"(.*?)\" in table \"(.*?)\"$")
	public void i_see_header_is_displayed_as_in_table(String arg1, String arg2, String arg3, DataTable table)
			throws Throwable {

		PageFactory.initElements(driver, DBUtilities.class).checkTableHeadersOrder(arg3, table);
	}

	@Then("^I see \"(.*?)\" is in \"(.*?)\" field and \"(.*?)\" is displayed as \"(.*?)\" in the row$")
	public void i_see_is_in_field_and_is_displayed_as(String arg1, String arg2, String arg3, String arg4,
			DataTable table) throws Throwable {
		PageFactory.initElements(driver, DBUtilities.class).checkRowValuesOrder(arg2, arg1, table);
	}

	// @And("^I see records in \"(.*?)\" are sorted by \"(.*?)\" in alphabetical
	// order$")
	// public void i_see_records_in_are_sorted_by_in_alphabetical_order(String
	// arg1, String arg2) throws Throwable {
	// PageFactory.initElements(driver,
	// DBUtilities.class).checkColumnValuesOrder(arg1, arg2);
	// }

	@And("^I click on \"(.*?)\" of the record with$")
	public void i_click_on_of_the_record_with(String arg1, DataTable table) throws Throwable {
		Thread.sleep(3000);
		DBUtilities dbutilities = new DBUtilities(driver);
		WebElement myElement = dbutilities.getElementbyRowIndexandClass(arg1, table);

		JavascriptExecutor executor = (JavascriptExecutor) driver;
		executor.executeScript("arguments[0].scrollIntoView(true);", myElement);
		myElement.click();
	}

	@And("^I click on \"(.*?)\" of the \"(.*?)\" list from the record with$")
	public void i_click_on_of_the_list_from_the_record_with(String arg1, String arg2, DataTable table)
			throws Throwable {
		Thread.sleep(3000);
		DBUtilities dbutilities = new DBUtilities(driver);
		WebElement myElement = dbutilities.getLinkFromListInTableRecord(arg2, arg1, table);

		JavascriptExecutor executor = (JavascriptExecutor) driver;
		executor.executeScript("arguments[0].scrollIntoView(true);", myElement);
		myElement.click();
	}

	// Checking the value of element attributes, for example, checking the value
	// of class, or type or value attributes
	@And("^I check \"(.*?)\" of \"(.*?)\" field is \"(.*?)\"$")
	public void i_check_of_field_is(String arg1, String arg2, String arg3) throws Throwable {
		String myxpath = "//*[contains(@id, '" + arg2 + "')][@" + arg1 + " = '" + arg3 + "']";
		System.out.println("checking ========= " + myxpath);
		Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
	}

	@And("^I check \"(.*?)\" of \"(.*?)\" field is not \"(.*?)\"$")
	public void i_check_of_field_is_not(String arg1, String arg2, String arg3) throws Throwable {
		String myxpath = "//*[contains(@id, '" + arg2 + "')][@" + arg1 + " = '" + arg3 + "']";
		System.out.println("checking ========= " + myxpath);
		Assert.assertFalse(driver.findElement(By.xpath(myxpath)).isDisplayed());
	}

	// Checking if the checkbox is checked (only for Outsystems checkboxes)
	@And("^I check the status of checkbox \"(.*?)\" is checked$")
	public void i_check_the_status_of_checkbox_is_checked(String arg1) throws Throwable {
		String myxpath = "//*[contains(@id, '" + arg1 + "')][contains(@class, 'Changed')]";
		System.out.println("checking ========= " + myxpath);
		Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
	}

	// Checking if the checkbox is unchecked (only for Outsystems checkboxes)
	@And("^I check the status of checkbox \"(.*?)\" is not checked$")
	public void i_check_the_status_of_checkbox_is_not_checked(String arg1) throws Throwable {
		String myxpath = "//*[contains(@id, '" + arg1 + "')][contains(@class, 'Changed')]";
		System.out.println("checking ========= " + myxpath);
		Assert.assertFalse(driver.findElement(By.xpath(myxpath)).isDisplayed());
	}

	@And("^I click on radiobuttons as$")
	public void i_click_on_radiobuttons_as(DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		DBUtilities dbutilities = new DBUtilities(driver);
		for (int i = 1; i < data.size(); i++) {
			String myxpath = dbutilities.getInputXpathByTypeAndId("radio", data.get(i).get(1));
			WebElement myRadiobutton = driver.findElement(By.xpath(myxpath));
			myRadiobutton.click();
			Thread.sleep(5000);
		}
	}

	@Then("^I check \"(.*?)\" \"(.*?)\" is displayed as \"(.*?)\"$")
	public void i_check_is_displayed_as(String type, DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		DBUtilities dbutilities = new DBUtilities(driver);
		boolean isDisplayed = true;
		for (int i = 1; i < data.size(); i++) {
			String myxpath = dbutilities.getInputXpathByTypeAndId(type, data.get(i).get(1));
			if (!driver.findElement(By.xpath(myxpath)).isDisplayed()) {
				isDisplayed = false;
				break;
			}
		}
		Assert.assertTrue(isDisplayed);
	}

	@Then("^I see values of fields are displayed as$")
	public void i_see_values_of_fields_are_displayed_as(DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		DBUtilities dbutilities = new DBUtilities(driver);
		boolean isDisplayed = true;
		for (int i = 1; i < data.size(); i++) {
			String myxpath1 = dbutilities.xpathMakerByInputId(data.get(i).get(0));
			String myxpath2 = dbutilities.xpathMakerByValue(data.get(i).get(1));
			String combineXpath = dbutilities.combine2Xpaths(myxpath1, myxpath2);
			System.out.println("===========#########" + combineXpath);
			if (!driver.findElement(By.xpath(combineXpath)).isDisplayed()) {
				isDisplayed = false;
			}
		}
		Assert.assertTrue(isDisplayed);
	}

	@Then("^I \"(.*?)\" date as \"(.*?)\" date \"(.*?)\" \"(.*?)\" days$")
	// And I "verify" date as "today" date "plus" "4" days
	public void i_date_as_date_days(String arg1, String arg2, String arg3, String arg4) throws Throwable {

		if (arg2.equals("today")) {
			String readDNT = new DBUtilities(driver).DNT();
			String changedDate = readDNT + arg4;
			System.out.println("+++++++++" + changedDate);

		}

	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	// only fill in elements if preseent on screen, use carefully
	// 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	@Given("^I enter the details if present$")
	public void i_enter_the_details_if_present(DataTable table) throws Throwable {

		PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUIOnlyIfPresent(table);
		// In test
		Thread.sleep(1000);

	}

	@And("^I click on \"(.*?)\" if present$")
	public void i_click_on_if_present(String arg1) throws Throwable {
		// give time for page loading

		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMaker(arg1);
		boolean isPresent = driver.findElements(By.xpath(myxpath)).size() > 0;

		if (isPresent == true) {
			driver.findElement(By.xpath(myxpath)).click();

		} else {
			System.out.println(
					" Element not present so not doing anything as this function only does something when element is present");
		}

	}

	@Then("^I click on \"(.*?)\" radio option if present$")
	public void i_click_on_radio_option_if_present(String arg1) throws Throwable {

		String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg1);
		boolean isPresent = driver.findElements(By.xpath(myxpath)).size() > 0;
		if (isPresent == true) {
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else {
			System.out.println(
					" Element not present so not doing anything as this function only does something when element is present");
		}

	}

	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 88888888888888888888888888888888888888 ALGORITHM
	// 888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
	// 888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

	@Then("^for ALGO I click on \"(.*?)\" radio option$")
	public void for_ALGO_I_click_on_radio_option(String arg1) throws Throwable {
		if (arg1.equals("G30")) {
			String arg2 = "renalfailno";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			// driver.findElement(By.xpath(myxpath)).sendKeys(Keys.ENTER);
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("L30")) {
			String arg2 = "renalfailyes";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("1AL")) {
			String arg2 = "genotype1a";
			String arg3 = "viralload6mlessgroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerByIdAndlabel(arg3);
			driver.findElement(By.xpath(myxpath2)).click();

		} else if (arg1.equals("1AG")) {
			String arg2 = "genotype1a";
			String arg3 = "viralload6mgreatergroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerByIdAndlabel(arg3);
			driver.findElement(By.xpath(myxpath2)).click();

		} else if (arg1.equals("1AU")) {
			String arg2 = "genotype1a";
			String arg3 = "viralloadunknowngroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerByIdAndlabel(arg3);
			driver.findElement(By.xpath(myxpath2)).click();

		} else if (arg1.equals("1BL")) {
			String arg2 = "genotype1b";
			String arg3 = "viralload6mlessgroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("1BG")) {
			String arg2 = "genotype1b";
			String arg3 = "viralload6mgreatergroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerByIdAndlabel(arg3);
			driver.findElement(By.xpath(myxpath2)).click();

		} else if (arg1.equals("1BU")) {
			String arg2 = "genotype1b";
			String arg3 = "viralload6mgreatergroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
					.xpathMakerByIdAndlabel(arg3);
			driver.findElement(By.xpath(myxpath2)).click();

		} else if (arg1.equals("2XX")) {
			String arg2 = "genotype2";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("3XX")) {
			String arg2 = "genotype3";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("4XX")) {
			String arg2 = "genotype4";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("5XX")) {
			String arg2 = "genotype5";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

		} else if (arg1.equals("6XX")) {
			String arg2 = "genotype6";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

			/// following is for therapy

		} else if (arg1.equals("XPN")) {
			String arg2 = "genotype6";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("X5A")) {
			String arg2 = "nsa5expgroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("X5B")) {
			String arg2 = "genotype6";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("XAB")) {
			String arg2 = "nsa5a5bxpgroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("XIF")) {
			String arg2 = "interferonexpgroup";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

			// for TreatmentOutcome (this decides if Therapy is considered)
		} else if (arg1.equals("NVX")) {
			String arg2 = "previoustherapyno";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

			// only if above is non NVX
		} else if (!arg1.equals(" ")) {
			String arg2 = "previoustherapyyes";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);

			// this is for Outcome

		} else if (arg1.equals("XNX")) {
			String arg2 = "therapyOutcome1";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("XRP")) {
			String arg2 = "therapyOutcome4";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("XIN")) {
			String arg2 = "therapyOutcome2";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else if (arg1.equals("XUN")) {
			String arg2 = "therapyOutcome3";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg2);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		}

	}

	@Given("^for ALGO I select on \"(.*?)\",\"(.*?)\" and \"(.*?)\" radio option$")
	public void for_ALGO_I_select_on_and_radio_option(String arg1, String arg2, String arg3) throws Throwable {

		// for TreatmentOutcome (this decides if Therapy is considered)
		if (arg1.equals("NVX")) {
			arg1 = "previoustherapyno";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg1);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
		} else {
			arg1 = "previoustherapyyes";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(arg1);
			driver.findElement(By.xpath(myxpath)).click();
			System.out.println(" Selecting radio option " + arg1);
			// going down as page expands
			//go down
			String upOrDown = "down";
			new DBUtilities(driver).scrollDownThePage(upOrDown);
			Thread.sleep(1000);
			if (arg2.equals("XPN")) {
				// arg2 = "genotype6";
				arg2 = "proteaseexpgroup"; // this is Protease
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);
			} else if (arg2.equals("X5A")) {
				arg2 = "nsa5expgroup";
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);
			} else if (arg2.equals("X5B")) {
				arg2 = "nsa5bexpgroup";
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);
			} else if (arg2.equals("XAB")) {
				arg2 = "nsa5a5bxpgroup";
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);
			} else if (arg2.equals("XIF")) {
				arg2 = "interferonexpgroup";
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);

				// for TreatmentOutcome (this decides if Therapy is considered)
			} else if (arg2.equals("NVX")) {
				arg2 = "previoustherapyno";
				String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg2);
				driver.findElement(By.xpath(myxpath2)).click();
				System.out.println(" Selecting radio option " + arg2);

			}

			// this is for Outcome

			if (arg3.equals("XNX")) {
				arg3 = "outcomenullgroup";
				String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg3);
				driver.findElement(By.xpath(myxpath3)).click();
				System.out.println(" Selecting radio option " + arg3);
			} else if (arg3.equals("XRP")) {
				arg3 = "outcomerelapsegroup";
				String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg3);
				driver.findElement(By.xpath(myxpath3)).click();
				System.out.println(" Selecting radio option " + arg3);
			} else if (arg3.equals("XIN")) {
				arg3 = "outcomeintolerancegroup";
				String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg3);
				driver.findElement(By.xpath(myxpath3)).click();
				System.out.println(" Selecting radio option " + arg3);
			} else if (arg3.equals("XUN")) {
				arg3 = "outcomeexpgroup";
				String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class)
						.xpathMakerByIdAndlabel(arg3);
				driver.findElement(By.xpath(myxpath3)).click();
				System.out.println(" Selecting radio option " + arg3);

			}
		}

	}

	// this makes the case C or NC

	@Then("^for ALGO I select \"(.*?)\"$")
	public void for_ALGO_I_select(String arg1) throws Throwable {
		if (arg1.equals("CX")) {

			String arg2 = "aprilevl";
			String arg3 = "ast";
			String arg4 = "Platelet";
			//update as other field are needed as well
			String arg5 = "billrubin";
			String arg6 = "inr";
			String arg7 = "albumin";
			String arg8 = "creatinine";
			
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg2);
			driver.findElement(By.xpath(myxpath2)).sendKeys("20");
			String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg3);
			driver.findElement(By.xpath(myxpath3)).sendKeys("21");
			String myxpath4 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg4);
			driver.findElement(By.xpath(myxpath4)).sendKeys("22");
			
			//fin in complications:
			
			// for ast
			String myxpath5 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg5);
			driver.findElement(By.xpath(myxpath5)).sendKeys("2");

			// for platel
			String myxpath6= PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg6);
			driver.findElement(By.xpath(myxpath6)).sendKeys("2");
			
			String myxpath7 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg7);
			driver.findElement(By.xpath(myxpath7)).sendKeys("2");
			
			
			String myxpath8 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg8);
			driver.findElement(By.xpath(myxpath8)).sendKeys("2");
			

//			//update as other field are needed as well
			String upOrDown = "down";
			new DBUtilities(driver).scrollDownThePage(upOrDown);
			// select the radio buttons:
			String myxpath81 = "Poorly controlled"; 
			String myxpath9 = "Grade 1-2";
			String myxpath10 = "variscesyes";
			String myxpath11 = "bleedingyes";
			
			String myxpath12 = 	PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMaker(myxpath81);
			driver.findElement(By.xpath(myxpath12)).click();
			String myxpath13 = 	PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByLabelContainsText(myxpath9);
			driver.findElement(By.xpath(myxpath13)).click();
			String myxpath14 = 	PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(myxpath10);
			driver.findElement(By.xpath(myxpath14)).click();
			String myxpath15 = 	PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerByIdAndlabel(myxpath11);
			driver.findElement(By.xpath(myxpath15)).click();
			
			
	
			
		} else {

			String arg2 = "aprilevl";
			String arg3 = "ast";
			String arg4 = "Platelet";
			String myxpath = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg2);
			driver.findElement(By.xpath(myxpath)).sendKeys("20");

			// for ast
			String myxpath2 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg3);
			driver.findElement(By.xpath(myxpath2)).sendKeys("20");

			// for platel
			String myxpath3 = PageFactory.initElements(driver, Gessit_AddPatientPage.class).xpathMakerById(arg4);
			driver.findElement(By.xpath(myxpath3)).sendKeys("200");

		}

	}

}
