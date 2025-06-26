; ModuleID = 'svp_simple_021_001.bc'
source_filename = "./svp_simple_021_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.svp_simple_021_001_tc_block_data = type { i8, i8, i8 }

@svp_simple_021_001_tc_block_rcvd_bytes_ch1 = common global i16 0, align 2
@svp_simple_021_001_tc_block_rcvd_bytes_ch2 = common global i16 0, align 2
@svp_simple_021_001_tc_chan1_buff = common global [256 x i8] zeroinitializer, align 16
@svp_simple_021_001_tc_buff_p = common global i8* null, align 8
@svp_simple_021_001_tc_block_rcvd_bytes = common global i16 0, align 2
@svp_simple_021_001_tc_chan2_buff = common global [256 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_init() #0 !dbg !7 {
  %1 = call i32 (...) @rand(), !dbg !10
  %2 = trunc i32 %1 to i16, !dbg !10
  store volatile i16 %2, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !11, !tbaa !12
  %3 = call i32 (...) @rand(), !dbg !16
  %4 = trunc i32 %3 to i16, !dbg !16
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !17, !tbaa !12
  call void (...) @init(), !dbg !18
  ret void, !dbg !19
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_RecvTcBlock() #0 !dbg !20 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = bitcast i32* %1 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !21
  store i32 0, i32* %1, align 4, !dbg !22, !tbaa !23
  %4 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !25, !tbaa !12
  %5 = zext i16 %4 to i32, !dbg !25
  %6 = icmp sge i32 %5, 16, !dbg !26
  br i1 %6, label %7, label %21, !dbg !25

7:                                                ; preds = %0
  store volatile i16 0, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !27, !tbaa !12
  %8 = bitcast i32* %2 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !28
  store i32 0, i32* %2, align 4, !dbg !29, !tbaa !23
  br label %9, !dbg !30

9:                                                ; preds = %16, %7
  %10 = load i32, i32* %2, align 4, !dbg !31, !tbaa !23
  %11 = icmp slt i32 %10, 256, !dbg !32
  br i1 %11, label %12, label %19, !dbg !33

12:                                               ; preds = %9
  %13 = load i32, i32* %2, align 4, !dbg !34, !tbaa !23
  %14 = sext i32 %13 to i64, !dbg !35
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i64 0, i64 %14, !dbg !35
  store volatile i8 0, i8* %15, align 1, !dbg !36, !tbaa !37
  br label %16, !dbg !38

16:                                               ; preds = %12
  %17 = load i32, i32* %2, align 4, !dbg !39, !tbaa !23
  %18 = add nsw i32 %17, 1, !dbg !39
  store i32 %18, i32* %2, align 4, !dbg !39, !tbaa !23
  br label %9, !dbg !33, !llvm.loop !40

19:                                               ; preds = %9
  store i32 255, i32* %1, align 4, !dbg !41, !tbaa !23
  %20 = bitcast i32* %2 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !42
  br label %21, !dbg !42

21:                                               ; preds = %19, %0
  %22 = bitcast i32* %1 to i8*, !dbg !43
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3, !dbg !43
  ret void, !dbg !43
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_main() #0 !dbg !44 {
  %1 = alloca %struct.svp_simple_021_001_tc_block_data, align 1
  %2 = alloca i32, align 4
  %3 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !45
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %3) #3, !dbg !45
  call void @svp_simple_021_001_init(), !dbg !46
  call void @svp_simple_021_001_RecvTcBlock(), !dbg !47
  %4 = bitcast i32* %2 to i8*, !dbg !48
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !48
  store i32 0, i32* %2, align 4, !dbg !49, !tbaa !23
  br label %5, !dbg !50

5:                                                ; preds = %28, %0
  %6 = load i32, i32* %2, align 4, !dbg !51, !tbaa !23
  %7 = icmp slt i32 %6, 2, !dbg !52
  br i1 %7, label %8, label %31, !dbg !53

8:                                                ; preds = %5
  %9 = load i32, i32* %2, align 4, !dbg !54, !tbaa !23
  %10 = icmp eq i32 %9, 0, !dbg !55
  br i1 %10, label %11, label %13, !dbg !54

11:                                               ; preds = %8
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan1_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !56, !tbaa !57
  %12 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !59, !tbaa !12
  store volatile i16 %12, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !60, !tbaa !12
  br label %15, !dbg !61

13:                                               ; preds = %8
  store i8* getelementptr inbounds ([256 x i8], [256 x i8]* @svp_simple_021_001_tc_chan2_buff, i32 0, i32 0), i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !62, !tbaa !57
  %14 = load volatile i16, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch2, align 2, !dbg !63, !tbaa !12
  store volatile i16 %14, i16* @svp_simple_021_001_tc_block_rcvd_bytes, align 2, !dbg !64, !tbaa !12
  br label %15

15:                                               ; preds = %13, %11
  %16 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !65, !tbaa !57
  %17 = getelementptr inbounds i8, i8* %16, i64 2, !dbg !66
  %18 = load volatile i8, i8* %17, align 1, !dbg !67, !tbaa !37
  %19 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 0, !dbg !68
  store i8 %18, i8* %19, align 1, !dbg !69, !tbaa !70
  %20 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !72, !tbaa !57
  %21 = getelementptr inbounds i8, i8* %20, i64 4, !dbg !73
  %22 = load volatile i8, i8* %21, align 1, !dbg !74, !tbaa !37
  %23 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 1, !dbg !75
  store i8 %22, i8* %23, align 1, !dbg !76, !tbaa !77
  %24 = load i8*, i8** @svp_simple_021_001_tc_buff_p, align 8, !dbg !78, !tbaa !57
  %25 = getelementptr inbounds i8, i8* %24, i64 5, !dbg !79
  %26 = load volatile i8, i8* %25, align 1, !dbg !80, !tbaa !37
  %27 = getelementptr inbounds %struct.svp_simple_021_001_tc_block_data, %struct.svp_simple_021_001_tc_block_data* %1, i32 0, i32 2, !dbg !81
  store i8 %26, i8* %27, align 1, !dbg !82, !tbaa !83
  br label %28, !dbg !84

28:                                               ; preds = %15
  %29 = load i32, i32* %2, align 4, !dbg !85, !tbaa !23
  %30 = add nsw i32 %29, 1, !dbg !85
  store i32 %30, i32* %2, align 4, !dbg !85, !tbaa !23
  br label %5, !dbg !53, !llvm.loop !86

31:                                               ; preds = %5
  %32 = bitcast i32* %2 to i8*, !dbg !87
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !87
  %33 = bitcast %struct.svp_simple_021_001_tc_block_data* %1 to i8*, !dbg !87
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %33) #3, !dbg !87
  ret void, !dbg !87
}

; Function Attrs: nounwind uwtable
define void @svp_simple_021_001_isr_1() #0 !dbg !88 {
  %1 = load volatile i32, i32* inttoptr (i64 268435456 to i32*), align 4, !dbg !89, !tbaa !23
  %2 = lshr i32 %1, 3, !dbg !90
  %3 = and i32 %2, 8191, !dbg !91
  %4 = trunc i32 %3 to i16, !dbg !92
  store volatile i16 %4, i16* @svp_simple_021_001_tc_block_rcvd_bytes_ch1, align 2, !dbg !93, !tbaa !12
  ret void, !dbg !94
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_021")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_021_001_init", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_021_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_021")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 34, column: 48, scope: !7)
!11 = !DILocation(line: 34, column: 46, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 35, column: 48, scope: !7)
!17 = !DILocation(line: 35, column: 46, scope: !7)
!18 = !DILocation(line: 37, column: 3, scope: !7)
!19 = !DILocation(line: 38, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "svp_simple_021_001_RecvTcBlock", scope: !8, file: !8, line: 40, type: !9, scopeLine: 40, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 41, column: 3, scope: !20)
!22 = !DILocation(line: 42, column: 33, scope: !20)
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !14, i64 0}
!25 = !DILocation(line: 44, column: 7, scope: !20)
!26 = !DILocation(line: 44, column: 50, scope: !20)
!27 = !DILocation(line: 45, column: 48, scope: !20)
!28 = !DILocation(line: 46, column: 5, scope: !20)
!29 = !DILocation(line: 47, column: 12, scope: !20)
!30 = !DILocation(line: 47, column: 10, scope: !20)
!31 = !DILocation(line: 47, column: 17, scope: !20)
!32 = !DILocation(line: 47, column: 19, scope: !20)
!33 = !DILocation(line: 47, column: 5, scope: !20)
!34 = !DILocation(line: 48, column: 40, scope: !20)
!35 = !DILocation(line: 48, column: 7, scope: !20)
!36 = !DILocation(line: 48, column: 43, scope: !20)
!37 = !{!14, !14, i64 0}
!38 = !DILocation(line: 49, column: 5, scope: !20)
!39 = !DILocation(line: 47, column: 27, scope: !20)
!40 = distinct !{!40, !33, !38}
!41 = !DILocation(line: 50, column: 35, scope: !20)
!42 = !DILocation(line: 51, column: 3, scope: !20)
!43 = !DILocation(line: 52, column: 1, scope: !20)
!44 = distinct !DISubprogram(name: "svp_simple_021_001_main", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 55, column: 3, scope: !44)
!46 = !DILocation(line: 57, column: 3, scope: !44)
!47 = !DILocation(line: 59, column: 3, scope: !44)
!48 = !DILocation(line: 60, column: 3, scope: !44)
!49 = !DILocation(line: 61, column: 14, scope: !44)
!50 = !DILocation(line: 61, column: 8, scope: !44)
!51 = !DILocation(line: 61, column: 19, scope: !44)
!52 = !DILocation(line: 61, column: 25, scope: !44)
!53 = !DILocation(line: 61, column: 3, scope: !44)
!54 = !DILocation(line: 62, column: 9, scope: !44)
!55 = !DILocation(line: 62, column: 15, scope: !44)
!56 = !DILocation(line: 63, column: 36, scope: !44)
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !14, i64 0}
!59 = !DILocation(line: 65, column: 11, scope: !44)
!60 = !DILocation(line: 64, column: 46, scope: !44)
!61 = !DILocation(line: 66, column: 5, scope: !44)
!62 = !DILocation(line: 67, column: 36, scope: !44)
!63 = !DILocation(line: 69, column: 11, scope: !44)
!64 = !DILocation(line: 68, column: 46, scope: !44)
!65 = !DILocation(line: 72, column: 23, scope: !44)
!66 = !DILocation(line: 72, column: 52, scope: !44)
!67 = !DILocation(line: 72, column: 21, scope: !44)
!68 = !DILocation(line: 72, column: 14, scope: !44)
!69 = !DILocation(line: 72, column: 19, scope: !44)
!70 = !{!71, !14, i64 0}
!71 = !{!"svp_simple_021_001_tc_block_data", !14, i64 0, !14, i64 1, !14, i64 2}
!72 = !DILocation(line: 73, column: 21, scope: !44)
!73 = !DILocation(line: 73, column: 50, scope: !44)
!74 = !DILocation(line: 73, column: 19, scope: !44)
!75 = !DILocation(line: 73, column: 14, scope: !44)
!76 = !DILocation(line: 73, column: 17, scope: !44)
!77 = !{!71, !14, i64 1}
!78 = !DILocation(line: 74, column: 28, scope: !44)
!79 = !DILocation(line: 74, column: 57, scope: !44)
!80 = !DILocation(line: 74, column: 26, scope: !44)
!81 = !DILocation(line: 74, column: 14, scope: !44)
!82 = !DILocation(line: 74, column: 24, scope: !44)
!83 = !{!71, !14, i64 2}
!84 = !DILocation(line: 75, column: 3, scope: !44)
!85 = !DILocation(line: 61, column: 35, scope: !44)
!86 = distinct !{!86, !53, !84}
!87 = !DILocation(line: 76, column: 1, scope: !44)
!88 = distinct !DISubprogram(name: "svp_simple_021_001_isr_1", scope: !8, file: !8, line: 78, type: !9, scopeLine: 78, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 80, column: 8, scope: !88)
!90 = !DILocation(line: 80, column: 34, scope: !88)
!91 = !DILocation(line: 80, column: 40, scope: !88)
!92 = !DILocation(line: 80, column: 7, scope: !88)
!93 = !DILocation(line: 79, column: 46, scope: !88)
!94 = !DILocation(line: 81, column: 1, scope: !88)
