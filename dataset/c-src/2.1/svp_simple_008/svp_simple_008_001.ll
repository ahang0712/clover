; ModuleID = 'svp_simple_008_001.bc'
source_filename = "./svp_simple_008_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_008_001_global_array = common global [100 x i32] zeroinitializer, align 16
@svp_simple_008_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_008_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %3 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !11
  store i32 1, i32* %1, align 4, !dbg !12, !tbaa !13
  %4 = bitcast i32* %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !17
  store i32 2, i32* %2, align 4, !dbg !18, !tbaa !13
  %5 = load i32, i32* %1, align 4, !dbg !19, !tbaa !13
  %6 = load i32, i32* %2, align 4, !dbg !20, !tbaa !13
  %7 = add nsw i32 %5, %6, !dbg !21
  %8 = sext i32 %7 to i64, !dbg !22
  %9 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %8, !dbg !22
  store volatile i32 9, i32* %9, align 4, !dbg !23, !tbaa !13
  store volatile i32 1, i32* getelementptr inbounds ([100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 40), align 16, !dbg !24, !tbaa !13
  call void @svp_simple_008_001_func_1(), !dbg !25
  %10 = bitcast i32* %2 to i8*, !dbg !26
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #3, !dbg !26
  %11 = bitcast i32* %1 to i8*, !dbg !26
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #3, !dbg !26
  ret void, !dbg !26
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_008_001_func_1() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = bitcast i32* %1 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !28
  %8 = bitcast i32* %2 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !28
  %9 = bitcast i32* %3 to i8*, !dbg !29
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #3, !dbg !29
  store i32 1, i32* %3, align 4, !dbg !30, !tbaa !13
  %10 = bitcast i32* %4 to i8*, !dbg !31
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3, !dbg !31
  store i32 2, i32* %4, align 4, !dbg !32, !tbaa !13
  %11 = bitcast i32* %5 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3, !dbg !33
  store i32 1, i32* %5, align 4, !dbg !34, !tbaa !13
  %12 = bitcast i32* %6 to i8*, !dbg !35
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #3, !dbg !35
  store i32 3, i32* %6, align 4, !dbg !36, !tbaa !13
  %13 = load i32, i32* %3, align 4, !dbg !37, !tbaa !13
  %14 = mul nsw i32 %13, 20, !dbg !38
  %15 = load i32, i32* %4, align 4, !dbg !39, !tbaa !13
  %16 = mul nsw i32 %15, 10, !dbg !40
  %17 = add nsw i32 %14, %16, !dbg !41
  %18 = sext i32 %17 to i64, !dbg !42
  %19 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %18, !dbg !42
  %20 = load volatile i32, i32* %19, align 4, !dbg !42, !tbaa !13
  store i32 %20, i32* %1, align 4, !dbg !43, !tbaa !13
  %21 = load i32, i32* %5, align 4, !dbg !44, !tbaa !13
  %22 = load i32, i32* %6, align 4, !dbg !45, !tbaa !13
  %23 = add nsw i32 %21, %22, !dbg !46
  %24 = sext i32 %23 to i64, !dbg !47
  %25 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %24, !dbg !47
  %26 = load volatile i32, i32* %25, align 4, !dbg !47, !tbaa !13
  store i32 %26, i32* %2, align 4, !dbg !48, !tbaa !13
  %27 = bitcast i32* %6 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3, !dbg !49
  %28 = bitcast i32* %5 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3, !dbg !49
  %29 = bitcast i32* %4 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !49
  %30 = bitcast i32* %3 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #3, !dbg !49
  %31 = bitcast i32* %2 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3, !dbg !49
  %32 = bitcast i32* %1 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !49
  ret void, !dbg !49
}

; Function Attrs: nounwind uwtable
define void @svp_simple_008_001_isr_1() #0 !dbg !50 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !51
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !51
  store i32 0, i32* %1, align 4, !dbg !52, !tbaa !13
  br label %3, !dbg !51

3:                                                ; preds = %12, %0
  %4 = load i32, i32* %1, align 4, !dbg !53, !tbaa !13
  %5 = icmp slt i32 %4, 100, !dbg !54
  br i1 %5, label %8, label %6, !dbg !55

6:                                                ; preds = %3
  %7 = bitcast i32* %1 to i8*, !dbg !55
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !55
  br label %15

8:                                                ; preds = %3
  %9 = load i32, i32* %1, align 4, !dbg !56, !tbaa !13
  %10 = sext i32 %9 to i64, !dbg !57
  %11 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_008_001_global_array, i64 0, i64 %10, !dbg !57
  store volatile i32 5, i32* %11, align 4, !dbg !58, !tbaa !13
  br label %12, !dbg !57

12:                                               ; preds = %8
  %13 = load i32, i32* %1, align 4, !dbg !59, !tbaa !13
  %14 = add nsw i32 %13, 1, !dbg !59
  store i32 %14, i32* %1, align 4, !dbg !59, !tbaa !13
  br label %3, !dbg !55, !llvm.loop !60

15:                                               ; preds = %6
  ret void, !dbg !62
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_008_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_008")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_008_001_main", scope: !8, file: !8, line: 13, type: !9, scopeLine: 13, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_008_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_008")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 14, column: 3, scope: !7)
!11 = !DILocation(line: 15, column: 3, scope: !7)
!12 = !DILocation(line: 15, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 16, column: 3, scope: !7)
!18 = !DILocation(line: 16, column: 7, scope: !7)
!19 = !DILocation(line: 18, column: 35, scope: !7)
!20 = !DILocation(line: 18, column: 39, scope: !7)
!21 = !DILocation(line: 18, column: 37, scope: !7)
!22 = !DILocation(line: 18, column: 3, scope: !7)
!23 = !DILocation(line: 18, column: 42, scope: !7)
!24 = !DILocation(line: 20, column: 39, scope: !7)
!25 = !DILocation(line: 22, column: 3, scope: !7)
!26 = !DILocation(line: 23, column: 1, scope: !7)
!27 = distinct !DISubprogram(name: "svp_simple_008_001_func_1", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 26, column: 3, scope: !27)
!29 = !DILocation(line: 27, column: 3, scope: !27)
!30 = !DILocation(line: 27, column: 7, scope: !27)
!31 = !DILocation(line: 28, column: 3, scope: !27)
!32 = !DILocation(line: 28, column: 7, scope: !27)
!33 = !DILocation(line: 29, column: 3, scope: !27)
!34 = !DILocation(line: 29, column: 7, scope: !27)
!35 = !DILocation(line: 30, column: 3, scope: !27)
!36 = !DILocation(line: 30, column: 7, scope: !27)
!37 = !DILocation(line: 31, column: 45, scope: !27)
!38 = !DILocation(line: 31, column: 47, scope: !27)
!39 = !DILocation(line: 31, column: 54, scope: !27)
!40 = !DILocation(line: 31, column: 56, scope: !27)
!41 = !DILocation(line: 31, column: 52, scope: !27)
!42 = !DILocation(line: 31, column: 13, scope: !27)
!43 = !DILocation(line: 31, column: 11, scope: !27)
!44 = !DILocation(line: 33, column: 45, scope: !27)
!45 = !DILocation(line: 33, column: 49, scope: !27)
!46 = !DILocation(line: 33, column: 47, scope: !27)
!47 = !DILocation(line: 33, column: 13, scope: !27)
!48 = !DILocation(line: 33, column: 11, scope: !27)
!49 = !DILocation(line: 34, column: 1, scope: !27)
!50 = distinct !DISubprogram(name: "svp_simple_008_001_isr_1", scope: !8, file: !8, line: 36, type: !9, scopeLine: 36, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 37, column: 8, scope: !50)
!52 = !DILocation(line: 37, column: 12, scope: !50)
!53 = !DILocation(line: 37, column: 19, scope: !50)
!54 = !DILocation(line: 37, column: 21, scope: !50)
!55 = !DILocation(line: 37, column: 3, scope: !50)
!56 = !DILocation(line: 37, column: 65, scope: !50)
!57 = !DILocation(line: 37, column: 33, scope: !50)
!58 = !DILocation(line: 37, column: 68, scope: !50)
!59 = !DILocation(line: 37, column: 29, scope: !50)
!60 = distinct !{!60, !55, !61}
!61 = !DILocation(line: 37, column: 70, scope: !50)
!62 = !DILocation(line: 38, column: 1, scope: !50)
