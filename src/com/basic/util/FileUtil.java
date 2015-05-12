package com.basic.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件相关的类,支持以下方法 清除文件目录(删除目录下所有文件,但保留目录)
 * 复制目录(包含目录下所有文件),复制文件,删除文件,删除目录(删除目录下所有文件,不保留目录) 获取文件的MD5和SHA 获取指定HTTP
 * Url返回的数据,保存到指定文件 压缩文件或目录,解压缩文件到当前目录
 * 
 * @author Emck
 * 
 */
public class FileUtil {
	private static final String MD5 = "MD5";
	private static final String SHA = "SHA";

	/**
	 * 得到文件的MD5码(小写字母),用于校验
	 * 
	 * @param FileName
	 *            需要计算的文件名路径
	 * @return 返回计算后的MD5值
	 */
	public static String GetFileMD5String(String FileName) {
		return getFileString(new File(FileName), MD5);
	}

	/**
	 * 得到文件的SHA码(小写字母),用于校验
	 * 
	 * @param FileName
	 *            需要计算的文件名路径
	 * @return 返回计算后的SHA值
	 */
	public static String GetFileSHAString(String FileName) {
		return getFileString(new File(FileName), SHA);
	}

	/**
	 * 得到文件的MD5 或 SHA ,用于校验
	 * 
	 * @param SourceFile
	 *            文件路径
	 * @param jProgressBar
	 *            进度条(需要界面支持)
	 * @param Algorithm
	 *            算法,支持 MD5 和 SHA
	 * @return 返回计算后的字符串
	 */
	private static String getFileString(File SourceFile, /*
														 * JProgressBar
														 * jProgressBar,
														 */String Algorithm) {
		if (SourceFile.exists() == false)
			return null; // 如果文件不存在则返回null
		if (Algorithm == null || Algorithm.length() <= 0)
			return null; // 如果算法为空则返回null
		FileInputStream fileInputStream = null;
		// if (jProgressBar != null) {
		// jProgressBar.setMaximum((int) SourceFile.length());
		// jProgressBar.setValue(0);
		// jProgressBar.setString("Ready Calculate MD5 from file: " +
		// SourceFile.getName());
		// }
		try {
			MessageDigest md = MessageDigest.getInstance(Algorithm);
			fileInputStream = new FileInputStream(SourceFile);
			byte[] buffer = new byte[8192];
			int length = -1;
			// int value = 0;
			while ((length = fileInputStream.read(buffer)) != -1) {
				md.update(buffer, 0, length);
				// value += length;
				// if (jProgressBar != null) jProgressBar.setValue(value);
			}
			return FormatData.BytesToHexString(md.digest());
		} catch (Exception e) {
			return null;
		} finally {
			try {
				fileInputStream.close();
			} catch (IOException ex) {
			}
		}
	}

	/**
	 * 复制整个文件夹内容
	 * 
	 * @param oldPath
	 *            String 原文件路径 如：c:/fqf
	 * @param newPath
	 *            String 复制后路径 如：f:/fqf/ff
	 * @return boolean
	 */
	public static boolean copyFolder(String oldPath, String newPath) {
		try {
			(new File(newPath)).mkdirs(); // 如果文件夹不存在 则建立新文件夹
			File a = new File(oldPath);
			String[] file = a.list();
			File temp = null;
			for (int i = 0; i < file.length; i++) {
				if (oldPath.endsWith(File.separator)) {
					temp = new File(oldPath + file[i]);
				} else {
					temp = new File(oldPath + File.separator + file[i]);
				}

				if (temp.isFile()) {
					FileInputStream input = new FileInputStream(temp);
					FileOutputStream output = new FileOutputStream(newPath
							+ "/" + (temp.getName()).toString());
					byte[] b = new byte[1024 * 5];
					int len;
					while ((len = input.read(b)) != -1) {
						output.write(b, 0, len);
					}
					output.flush();
					output.close();
					input.close();
				}
				if (temp.isDirectory()) {// 如果是子文件夹
					copyFolder(oldPath + "/" + file[i], newPath + "/" + file[i]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void iteratorDirectory(String filepath, String oldStr,
			String replaceStr) {
		File file = new File(filepath);
		if (file.isDirectory()) {
			String[] fileList = file.list();

			for (int i = 0; i < fileList.length; i++) {
				iteratorDirectory(filepath + "/" + fileList[i], oldStr,
						replaceStr);
			}
		} else {
			replaceTxtByStr(filepath, oldStr, replaceStr);
		}
	}

	public static void replaceTxtByStr(String path, String oldStr,
			String replaceStr) {
		String temp = "";
		int len = oldStr.length();
		StringBuffer tempBuf = new StringBuffer();
		try {
			File file = new File(path);
			FileInputStream fis = new FileInputStream(file);
			InputStreamReader isr = new InputStreamReader(fis);
			BufferedReader br = new BufferedReader(isr);
			StringBuffer buf = new StringBuffer();

			while ((temp = br.readLine()) != null) {
				if (temp.contains(oldStr)) {
					int index = temp.indexOf(oldStr);
					tempBuf.append(temp);
					tempBuf.replace(index, index + len, replaceStr);
					buf.append(tempBuf);
					tempBuf.setLength(0);
				} else {
					buf.append(temp);
				}
				buf = buf.append(System.getProperty("line.separator"));

			}
			br.close();
			FileOutputStream fos = new FileOutputStream(file);
			PrintWriter pw = new PrintWriter(fos);
			pw.write(buf.toString().toCharArray());
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 得到指定文件夹下所有文件名(支持子目录)
	 * 
	 * @param Path
	 *            制定的文件夹
	 * @param Filter
	 *            文件名过滤规则
	 * @return 返回文件名列表
	 */
	public static List<String> GetFolderAllFileNames(String Path,
			FileFilter Filter) {
		if (Path == null)
			return null;
		else
			return GetFolder(new File(Path), Filter);
	}

	private static List<String> GetFolder(File Folder, FileFilter Filter) {
		File[] allFiles = Folder.listFiles(Filter); // 得到该文件夹下的所有文件夹和文件数组
		List<String> allFileName = new ArrayList<String>();
		for (int i = 0; i < allFiles.length; i++) {
			if (allFiles[i].isDirectory()) // 如果为文件夹...
				allFileName.addAll(GetFolder(allFiles[i], Filter)); // 递归调用此文件夹
			else if (allFiles[i].isFile()) // 如果是文件...
				allFileName.add(allFiles[i].getPath()); // 保存文件名
		}
		return allFileName;
	}

	/**
	 * 复制文件
	 * 
	 * @param SourceFile
	 *            待复制的文件
	 * @param DescFile
	 *            复制后的目标文件
	 * @param BuffSize
	 *            复制缓冲区大小(建议使用操作系统的默认块大小,这样会加快复制速度,减少无用的磁盘操作)
	 * @return 复制成功返回true,否则返回false
	 */
	public static boolean CopyFile(String SourceFile, String DescFile,
			int BuffSize) {
		byte buff[] = new byte[BuffSize];
		int leagth; // 长度
		try {
			FileInputStream in = new FileInputStream(SourceFile);
			FileOutputStream out = new FileOutputStream(DescFile);
			leagth = in.read(buff, 0, BuffSize); // 读取文件到缓冲区中
			while (leagth > 0) { // 读取到了数据则...
				out.write(buff, 0, leagth); // 写实际读取到的内容到目标文件中
				leagth = in.read(buff, 0, BuffSize);// 继续读取文件到缓冲区中
			}
			in.close();
			out.close();
			return true; // 复制结束
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 复制文件
	 * 
	 * @param SourceFile
	 *            待复制的文件
	 * @param DescFile
	 *            复制后的目标文件
	 * @return 复制成功返回true,否则返回false
	 */
	public static boolean CopyFile(String SourceFile, String DescFile) {
		return CopyFile(SourceFile, DescFile, 4096);
	}

	/**
	 * 清空指定的目录
	 * 
	 * @param delFolder
	 *            指定目录
	 * @return 清空成功返回true,否则返回false
	 */
	public static boolean ClearFolder(String Folder) {
		java.io.File fileFolder = new java.io.File(Folder);
		return DeleteFolder(fileFolder, false); // 删除目录下所有文件,但不删除自己
	}

	/**
	 * 清空指定的目录
	 * 
	 * @param delFolder
	 *            指定目录
	 * @return 清空成功返回true,否则返回false
	 */
	public static boolean ClearFolder(java.io.File Folder) {
		return DeleteFolder(Folder, false); // 删除目录下所有文件,但不删除自己
	}

	/**
	 * 删除指定的目录(目录允许为非空)
	 * 
	 * @param delFolder
	 *            指定目录
	 * @return 删除成功返回true,否则返回false
	 */
	public static boolean DeleteFolder(java.io.File Folder) {
		return DeleteFolder(Folder, true); // 删除目录下所有文件,且删除自己
	}

	/**
	 * 删除指定的目录(目录允许为非空)
	 * 
	 * @param delFolder
	 *            指定目录
	 * @return 删除成功返回true,否则返回false
	 */
	public static boolean DeleteFolder(String Folder) {
		File fileFolder = new File(Folder);
		return DeleteFolder(fileFolder, true); // 删除目录下所有文件,且删除自己
	}

	/**
	 * 删除指定的目录(目录允许为非空)
	 * 
	 * @param delFolder
	 *            指定目录
	 * @param IsDeleteMyself
	 *            是否要删除自身目录(true=删除; false=不删除)
	 * @return 删除成功返回true,否则返回false
	 */
	private static boolean DeleteFolder(File Folder, boolean IsDeleteMyself) {
		// 递归调用模式
		boolean hasDeleted = true; // 目录是否已删除
		File[] allFiles = Folder.listFiles(); // 得到该文件夹下的所有文件夹和文件数组
		for (int i = 0; i < allFiles.length; i++) {
			if (hasDeleted) { // 为true时操作
				if (allFiles[i].isDirectory())
					hasDeleted = DeleteFolder(allFiles[i]); // 如果为文件夹,则递归调用删除文件夹的方法
				else if (allFiles[i].isFile()) {
					try { // 删除文件
						if (!allFiles[i].delete())
							hasDeleted = false; // 删除失败,返回false
					} catch (Exception e) {
						hasDeleted = false; // 异常,返回false
					}
				}
			} else
				break; // 为false,跳出循环
		}
//		if (IsDeleteMyself == true && hasDeleted == true)
//			Folder.delete(); // 该文件夹已为空文件夹,删除它
		return hasDeleted;
	}

	/**
	 * 删除指定的文件
	 * 
	 * @param FileName
	 *            待删除的文件名
	 * @return 删除成功返回true,否则返回false
	 */
	public static boolean DeleteFile(String FileName) {
		File file = new File(FileName);
		return file.delete();
	}

	// ////
	/**
	 * 文件夹内容展示
	 * 
	 * @param root
	 *            文件的路径 注意测试路径和项目路径不一样具体情况具体裁定
	 * @return 文件夹里的所有文件
	 */
	public List<File> ScanFile(File root) {
		List<File> fileInfo = new ArrayList<File>();

		File[] files = root.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				if (pathname.isDirectory() && pathname.isHidden())
					return false;
				if (pathname.isFile() && pathname.isHidden())
					return false;
				return true;
			}
		});

		if (files == null || files.length <= 0)
			return null;

		for (File file : files) {
			if (file.isDirectory()) {
				List<File> ff = ScanFile(file);
				if (ff != null && ff.size() > 0)
					fileInfo.addAll(ff);
			} else
				fileInfo.add(file);
		}
		return fileInfo;
	}

	/***
	 * 显示文件下文件名的方法
	 * 
	 * @param f   文件路径
	 */
	public static String Filename(File f) {
		// 判断传入对象是否为一个文件夹对象
		   
		File[] t = f.listFiles();
		StringBuffer str = new StringBuffer();
		for (int i = 0; i < t.length; i++) {
			// 判断文件列表中的对象是否为文件夹对象，如果是则执行tree递归，直到把此文件夹中所有文件输出为止
			if (t[i].isDirectory()) {
				str.append(t[i].getName()).append(",");
			}
		}
		return str.toString();
	}

	/**
	 * 文件转移
	 * 
	 * @param oldpath
	 *            文件路径 注意测试路径和项目路径不一样具体情况具体裁定
	 * @param newpath
	 *            新的文件路径 注意测试路径和项目路径不一样具体情况具体裁定
	 * @return true or false
	 */
	public static boolean changeDirectory(String oldpath, String newpath) {
		boolean cunzai = false;
		if (!oldpath.equals(newpath)) {
			File oldfile = new File(oldpath);
			File newfile = new File(newpath);
			if (newfile.exists()) {// 若在待转移目录下，已经存在待转移文件
				oldfile.renameTo(newfile);
				cunzai = true;
			} else {
				oldfile.renameTo(newfile);
				cunzai = true;
			}
		}
		return cunzai;
	}

	// 创建目录
	public static String createDir(String destDirName) {
		String ceshi = "";
		File dir = new File(destDirName);
		if (dir.exists()) {// 判断目录是否存在
		} else {
			if (dir.mkdirs()) {// 创建目标目录
				return dir.getPath();
			}
		}
		return ceshi;
	}

}