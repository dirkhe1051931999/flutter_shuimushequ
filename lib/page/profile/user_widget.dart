import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/screen.dart';
import 'package:shuimushequ/common/values/colors.dart';
import 'package:shuimushequ/common/values/radii.dart';

Widget UserWidget(Function onTapUsername, Function onTapAvatar) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: duSetHeight(15), horizontal: duSetHeight(15)),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(duSetWidth(6)),
          child: Image.network(
            'http://ks3-cn-beijing.ksyun.com/avatar/66885a911ee88d9a28392ff35f1d062e',
            width: duSetWidth(60),
            height: duSetHeight(60),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: duSetHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTapUsername('username'),
                child: Row(
                  children: <Widget>[
                    Text(
                      'hejian',
                      style: TextStyle(
                        color: AppColors.fontBlue,
                        fontSize: duSetFontSize(16),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.fontBlue,
                      size: duSetFontSize(10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: duSetHeight(2)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: duSetWidth(5)),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: Image.memory(
                              base64.decode(
                                'data:image/png;base64,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'
                                    .split(',')[1],
                              ),
                              height: duSetHeight(17), //设置高度
                              width: duSetWidth(38), //设置宽度
                              fit: BoxFit.fill, //填充
                              gaplessPlayback: true, //防止重绘
                            ),
                          ),
                          Positioned(
                            left: duSetWidth(-5),
                            child: Image.memory(
                              base64.decode(
                                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAA5CAYAAABwDahPAAAAAXNSR0IArs4c6QAADSZJREFUaAXNWm2MnFUVvndmdnf2o+3utgvdwlLAYhET0EQaJeVHYdFfxigf/lB/KD/8SCX4gUk1qAEDBqIBbYJ/8JcYU4OJ0RikFRJAgVpMQI1gYynFskD3Y8q2s93tzrw+z3Pueefd2cWydIve7Tv33HPPec5zzr33nc68E8MZakefeXRTY75xT4yxGWPnzf2XX3ngTISKKw2a7dvXM9WY+iZwv55loYv4MYbZLIt3DZ7Tc2ccuWJmJWOuaAK1p/Zc14zZD0F8JBEPkJmAt0Mxlr8ysOWqX7nidPsW9GkgTT+z+z1z8+HHYHv1QhjCI4PgYVzOdndUOm5a/YFtzy+0X/7IkZfvCY/s+SdW1WonvpPF7KYsyzoiiGb4Y8/mMvuksFy0KvEkzO4ZWNN9e7x467QZLP/1bScwuXfPp7Nm8y4ADHObqBHNi0yF759kgAMNFRJMe0rTpTAWYumWwS2jDwhjmS/LTmDq6Ucuy7L5nSCyNS9nqniLfRZOTh8Nx/71d9Hp2/Te0NHXz4xweZacchlrFuPjGG8f/ODoc5x5q+0tJ1B77vGBZn3m9tDMvpDFUH6zAM35uXD8wD/C7Phr4APCMCbPrsGh0HvBJaHUqRvTku4wbyCT+2K149aB92+rLWnUpjxlAqh0nNy7+0aA35k1s3V50QS0sKL1wwfCzNhLIWuAR1sgDmOpHLrOHgm9514YQqlEDS7HaA2xw45geseaLR/+KVaGBm/aloqTGx/900Nb5kPYCcXlplw64OzkkVA/9EJozM7Y/hYqXoroToNnoNIZepBE9axzAVtIIJeTcYx7K+Xy9jVbRv+ck2oTiiHyqem/PDY0NztzJyY/xxXIJ9qERv14OPbSC2F+eiqRRVULN32Zc5wOMccRstHLQrm7N/SOXBQ61gy2IbeGXAEc/fvLHV07cNsdb82YtIAcyJannvz9FxHmdoTpx1gVZc/Gu4fkrBGOH9wf5ibGEhnAkGgiLzuUX6uvMwA0QDCYY0kh3AwJrA09510UKtUezdO/vUGDKoVbBz70kZ9gvuHzueXkU7u3hkZjJ0Jd5pOLegCfePVQqL/yova5KEGngAoKOEdcgoRIE1T1wAsSsIKgUFi8rrUbQs/Iu0IsVxaFlgL2sVR6Fi+4W13zBHXx+L6Hhmdns7sB96mlvUx78o2pcOzgC6E5W8eNpSTSxjkdRg4S/yxgHm7FzWc3JBAQb2UAi6YlkzWVG5Mh+Z7hjaF7/QjyxBh/7NlcZg/8n3V1xW/E8T/+7g0MV9FAACDiy0xO8ziYMwf/GeaOToQMtwY5l2CDyQiivm2IyDIKWjcOKtob2VNPwpTTPFeCyTSp49UMpa6e0DeyKXQMrIORG9KXsmNn0xXEAnkzIGECqG82cUD3h9kjr0jH2x7pMQka2D6FA31y4o7NVWmFoZwiUETzFYKWhNFUjJJtqchc5urhjf3Phsqq/tC3cbMOvK0IsXK+qyoiYGNVhRWsv/ZymPn3gZDNz3PP2T2bm1Rk9QI5rYC4us6o6BWqBMthMYzGrtNEk/5YFbciJleq1MAdrhZqf3sa5+NsHPTNuAUbZfpzFUusgP8R5tjL+0P9xedB/qRI2lZhxYlZVuUjthCrnqlPq+EJcYrGIMNefz4mQeo4LvTEsXMlNYi7Dd7wYcdCnBgfC7W/Pkna+R+xK1xB4rFpNedxh5IigcBISXCbKCgTMdm8WC4SSvV2MOoYOmEbZrJJt1ZUADZNRlBM1lM+PNS5H7cbDzsU2NZqCYYxK7JLCsb2+F4lKrSN2GM+Jy/DBQ7AZk3UqRjCUET4iSPmGcte0kwijSToq2kmgiSkQBzNMB5lAKUoknHD9SNh3gYDgERQnSHBwPWMbYA2z5HqaG4im2zYodmbGgWN8kSMNF6NuU1zwO3Jgice6iHLnRCp4dwbpiaUnSugoTMPL1U0EIDrk46QskMnSzfmgOh+FfR5UIEmbNoTq2AnXLPxGNrmjokB88ybb5t86QGgFZEVq++mrEQasCMhNgbMG+X2K026nSciSyDK3XyMC+0x1gT1LKYH41zgIV6osDNOt5yiDHXuFABDJ6AZHxOnwMjnFvUESTGFY7IOrUQPYocXH1e13TRPmd4FztofVLZfVLTwUnUKWfDO1EqElo4A8ZTNbY08cUzDVzboQVanM5lIBSsf0orWFd4elB01mk0gxNDWwdhxC6IZc8InCbDc5r4MTHBWO21bapCYceNc0oOvb3F7IzPXnAYhF1VXKCkYZYlpDPvTa15T9PzHJBwasbzmprI5EvdtpBq7gkaqRWGPkW3xUx0D2EoV+tPLIOEVqu143EaqPBQpKSNOlrxwrLXPJFJlylYJ6Eei5p0wkvWZ71DvVnKgwfXgX6ul/wu1FEkqrIBAWHW0lF4yOvOdiie+aeuwxHyH9gae9i5VUGgd8k3ICTq1suYhsyIUevd/u72TVIUKZeIZAMk0naNzLB16S4AV96pDpFM+pqlWIAEXz0AOeTqCU2EchkLdUyjGTfTT6putn1lGXbQCrXPAHIjEZBLBJJrWA9soWSyzK/oauMU3veJ7MdFrSxUjQKfPA0pZZG2W7iQtimmgaVVfisWrpCxtrhhjaZl2vFIRAG4a94ee24fzyYS9rEjEL2z1hSvAaJg3HwelEjqLoPnWGttca0xPJ5HmFnWcT6xUFTMgvsc1DH5Cg9L+pbjJL8fUISZgscHNgdFr2fBh28HMMo05oLvjup+MONF+aQLqFJN+SRSiZPOx7UN7jGVPPZJyX06Bl76AcaV40EAYeoHMDxb4aJdAdBPilKVmb3LFMadoKzDPTMqWPicuR4emo/6ZIuGkuNJBNkTzIyrOAGJBy0tVFnuQdsKy5Qsv19MVY9jk+BgLnGbEYi8fCsmOBhqq3pLN32wMDzKH/IqFAg3yCyo2n4JgX4FRgcZDY4HpA0IaIBg+i/JjJSny8yl3nsgKicfImcEPou1nCA6WsDlmKJ0nSjQuFMW2DZP1/U+btssQ4GdRF3we0EqUQYhOis8edNFxK/kCehJcNn3gljHJsNGYsmG0htR7g6wh31UtKcaMjMHY0OlLYJEv6NLHr+KWtw/1HhuuvRvOx7di1TDzyiF8/4nvhQCiQuEl4vlDfu5LWBV+q8B8Ey/7jx6PPQioAD6RpyRjUVYOiSzz0AHFNFQt8viGBArS68QDkp4NF8o/pwuhomCJATtOVgfPDtX+oVAfeymcmHw9RH6dAaLKhMtBI3T2dSCdfEtRNhQRwdAbtWoS5KxExZjGAqQel74+QUzeZfpWi3i5WkXYVBwRoCm/VolxGpK+G/XM1GPP955zQagObcC30QfxzKsW+AWaJUMgwjErKLn05gT+MpKetBY2EqRh2hZuACLF70Z5Bkqd3aF3/XmhsqY/0SWSrQZ7NnIvdVfCZsg/933lPQ0ol/FMq2/ju8OqCy4O5Y4qlE0UCAC88JyAY1WNmJKxzbglME9/v3zMSTyqgi0j0JcXcJJ9wBnsHt4Y+jdfGiqr14i8YxR7AD9A7qoboSb3/PLKRow7MXEpx0s1fpSbOTKG6zACkiWrjZXghuelcfLUuA0FCampYxKWIHuad2HbVofPxVcl6RkilfRJWEyghOcDiLd9cNsn7PlAMQQMyhOP/OpL8LoNcj8pMRZ7Ni40N06zOY+HeS+Hudq4FVLEYZUCMSGzND+eC/EgBgU29pK5z/tD7/B5eoLpMXOblAS6KZy1b6+9qnlfjDdgyaw5Nx+rn35s19DsXPw+Bp9FwNxGxBBUFccknx3UDx8M83U8aJcVzkRKIgdMBHysO4wG2J5d3aFnPfZ5r46gcJmg41NGxbHjsvu7ytUdq7d99L8/I/Mg3o//YdcWlBIPte0ppXNxjtCL72ytFmZeOxQacycsuJLBS546EFPhWfVY7gzdZw2H6tqztAjteMRlg35vCOXt60avXd5TSnO3V1ShNPnIgzc2s+YdIMHHJXkjP8ZynvXXD4cTE6/q+ZnrcmPa4c7WNbge5PF4lTewRS1HO4L3rB2DV19/es+Ji/i1x387gC3zPWyBzyOMTpmfCfZq6Hg+uK3mapNgDIVuq3gjWj2A+/nGUOrobK1GWwXwbtKAx33lCp7Ub/v4yjypLyZBeerRXe+bn8/405qt2j++jzjJPBIpPUPG00y2vnPOD5WePsnFF3fVlsFvJcp8+jh63Zn5rUQxMOXxh3d9Bv91uAuk17dK2m7VVuJihjLVRhvDSb1laPT6d+bXKkWKR5749apQn/kuDtuXUcVT/16o4Ayfk7gl39vsrt42tPVj7/zvhQpcwsSeXZfgv9w/wg66+lS3Fd2FYml36CjftG7bdf/bX2wVk6A88fAvrkcSP8Cda0RzvD/6RocCI/xmLn517TWffFDzK/CiTbgCODlEtu83PROT9W8hia+BffpxUJyNpezutb3lO+IVN/z//moxzwLC0Ud3bZo72bwXFWpUSh03949ee6A4v1LyfwC9sUSQ74H0bwAAAABJRU5ErkJggg=='
                                    .split(',')[1],
                              ),
                              height: duSetHeight(16), //设置高度
                              width: duSetWidth(14), //设置宽度
                              fit: BoxFit.fill, //填充
                              gaplessPlayback: true, //防止重绘
                            ),
                          ),
                          Positioned(
                            left: duSetWidth(0),
                            top: duSetHeight(2),
                            child: Text(
                              '2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: duSetFontSize(10),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: duSetWidth(4),
                            child: Text(
                              '幼苗',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: duSetFontSize(10),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat',
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: duSetWidth(5)),
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                            width: duSetWidth(40),
                            height: duSetHeight(18),
                            decoration: BoxDecoration(
                              color: AppColors.bgBlue,
                              borderRadius: Radii.k10pxRadius,
                            ),
                          )),
                          Positioned(
                            left: duSetWidth(7),
                            child: Text(
                              '男用户',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: duSetFontSize(10),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Avenir',
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '昵称: hejian',
                style: TextStyle(
                  color: AppColors.subGrey,
                  fontSize: duSetFontSize(14),
                  fontFamily: 'Montserrat',
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
