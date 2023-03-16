const base64toFormData: (base64url: string) => FormData = (
  base64url: string
) => {
  const replacedUrl = base64url.split(",")[1];
  const byteString : string = window.atob(replacedUrl);
  const arrayBuffer = new ArrayBuffer(byteString.length);
  const int8Array = new Uint8Array(arrayBuffer);
  for (let i =0;i<byteString.length;i++) {
    int8Array[i] = byteString.charCodeAt(i);
  }

  // const int16Array = new Uint16Array(replacedUrl.length);
  // for(let i=0;i<replacedUrl.length;i++) {
  //   int16Array[i] = replacedUrl.charCodeAt(i);
  // }

  // const byteString = btoa(String.fromCharCode(...new Uint8Array(int16Array.buffer)));
  const type = base64url.split(":")[1].split(";")[0];
  console.log(type);
  const blob = new Blob([int8Array], { type : type });
  // const blob = new Blob([int16Array], { type : "image/png" });

  // const binary = atob(replacedUrl);
  // const arrayBuffer = new ArrayBuffer(binary.length);
  // const data = new Uint8Array(arrayBuffer);
  // for (let i =0;i<bytes.length;i++) {
  //   bytes[i] = binary.charCodeAt(i);
  // }
  // const byteString = String.fromCharCode(...new Uint16Array(bytes.buffer));

  // let result = "";
  // let i = 0;
  // let c = 0;
  // let c3 = 0;
  // let c2 = 0;

  // // If we have a BOM skip it
  // if (
  //   data.length >= 3 &&
  //   data[0] === 0xef &&
  //   data[1] === 0xbb &&
  //   data[2] === 0xbf
  // ) {
  //   i = 3;
  // }

  // while (i < data.length) {
  //   c = data[i];

  //   if (c < 128) {
  //     result += String.fromCharCode(c);
  //     i++;
  //   } else if (c > 191 && c < 224) {
  //     if (i + 1 >= data.length) {
  //       throw "UTF-8 Decode failed. Two byte character was truncated.";
  //     }
  //     c2 = data[i + 1];
  //     result += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
  //     i += 2;
  //   } else {
  //     if (i + 2 >= data.length) {
  //       throw "UTF-8 Decode failed. Multi byte character was truncated.";
  //     }
  //     c2 = data[i + 1];
  //     c3 = data[i + 2];
  //     result += String.fromCharCode(
  //       ((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63)
  //     );
  //     i += 3;
  //   }
  // }


  // *. Blob 객체 생성
  // const blob = new Blob([result], { type: "image/png" });

  const formData = new FormData();
  formData.append("image", blob);

  return formData;
};

export default base64toFormData;
