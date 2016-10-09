package com.doubleview.jeebase.support.render;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import java.awt.*;
import java.awt.geom.QuadCurve2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 *验证码Render
 */
public class CaptchaRender extends Render {

	//验证码参数名
	public static String captchaName = "validateCode";

	// 默认的验证码大小
	private static final int WIDTH = 108, HEIGHT = 40;
	// 验证码随机字符数组
	private static final String[] strArr = {"3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y"};
	// 验证码字体
	private static final Font[] RANDOM_FONT = new Font[] {
		new Font("nyala", Font.BOLD, 38),
		new Font("Arial", Font.BOLD, 32),
		new Font("Bell MT", Font.BOLD, 32),
		new Font("Credit valley", Font.BOLD, 34),
		new Font("Impact", Font.BOLD, 32),
		new Font(Font.MONOSPACED, Font.BOLD, 40)
	};

	/**
	 * 生成验证码
	 */
	public void render() {
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		String validateCode = drawGraphic(image);
		validateCode = validateCode.toUpperCase();

		request.getSession().setAttribute(captchaName, validateCode);

		response.setHeader("Pragma","no-cache");
		response.setHeader("Cache-Control","no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		ServletOutputStream sos = null;
		try {
			sos = response.getOutputStream();
			ImageIO.write(image, "jpeg", sos);
		} catch (IOException e) {
			throw new RenderException(e);
		} catch (Exception e) {
			throw new RenderException(e);
		} finally {
			IOUtils.closeQuietly(sos);
		}
	}

	private String drawGraphic(BufferedImage image){
		// 获取图形上下文
		Graphics2D g = image.createGraphics();

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_NEAREST_NEIGHBOR);
		// 图形抗锯齿
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		// 字体抗锯齿
		g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

		// 设定背景色
		g.setColor(getRandColor(200, 250));
		g.fillRect(0, 0, WIDTH, HEIGHT);

		//生成随机类
		Random random = new Random();
		//设定字体
		g.setFont(RANDOM_FONT[random.nextInt(RANDOM_FONT.length)]);

		// 画蛋蛋，有蛋的生活才精彩
		Color color;
		for(int i = 0; i < 10; i++){
			color = getRandColor(120, 200);
			g.setColor(color);
			g.drawOval(random.nextInt(WIDTH), random.nextInt(HEIGHT), 5 + random.nextInt(10), 5 + random.nextInt(10));
		}

		// 取随机产生的认证码(4位数字)
		String sRand = "";
		for (int i = 0; i < 4; i++){
			String rand = String.valueOf(strArr[random.nextInt(strArr.length)]);
			sRand += rand;
			//旋转度数 最好小于45度
			int degree = random.nextInt(28);
			if (i % 2 == 0) {
				degree = degree * (-1);
			}
			//定义坐标
			int x = 22 * i, y = 21;
			//旋转区域
			g.rotate(Math.toRadians(degree), x, y);
			//设定字体颜色
			color = getRandColor(20, 130);
			g.setColor(color);
			//将认证码显示到图象中
			g.drawString(rand, x + 8, y + 10);
			//旋转之后，必须旋转回来
			g.rotate(-Math.toRadians(degree), x, y);
		}
		//图片中间线
		g.setColor(getRandColor(0, 60));
		//width是线宽,float型
		BasicStroke bs = new BasicStroke(3);
		g.setStroke(bs);
		//画出曲线
		QuadCurve2D.Double curve = new QuadCurve2D.Double(0d, random.nextInt(HEIGHT - 8) + 4, WIDTH / 2, HEIGHT / 2, WIDTH, random.nextInt(HEIGHT - 8) + 4);
		g.draw(curve);
		// 销毁图像
		g.dispose();
		return sRand;
	}

	/**
	 * 给定范围获得随机颜色
	 */
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * 验证码
	 * @param session 用户会话
	 * @param userInputCaptcha 用户输入的验证码
	 * @return 验证通过返回 true, 否则返回 false
	 */
	public static boolean validate(Session session, String userInputCaptcha) {
		if (StringUtils.isBlank(userInputCaptcha)) {
			return false;
		}
		userInputCaptcha = userInputCaptcha.toUpperCase();
		String sessionCaptcha = (String)session.removeAttribute(captchaName);//取出验证码
		return userInputCaptcha.equals(sessionCaptcha);
	}
}




