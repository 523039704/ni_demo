package com.basic.util;  

import java.io.File;  

import org.apache.tools.ant.Project;  
import org.apache.tools.ant.taskdefs.Zip;  
import org.apache.tools.ant.types.FileSet;  

public class ZipFileUtil {  

  private File zipFile;  

  public ZipFileUtil(String pathName) {  
      zipFile = new File(pathName);  
  }  
public void compress(String srcPathName) {  
      File srcdir = new File(srcPathName);  
      if (!srcdir.exists())  
          throw new RuntimeException(srcPathName + "不存在！");  
        
      Project prj = new Project();  
      Zip zip = new Zip();  
      zip.setProject(prj);  
      zip.setDestFile(zipFile);  
      FileSet fileSet = new FileSet();  
      fileSet.setProject(prj);  
      fileSet.setDir(srcdir);  
      zip.addFileset(fileSet);  
        
      zip.execute();  
  }  
}   