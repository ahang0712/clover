; ModuleID = 'svp_simple_024_001-opt.bc'
source_filename = "./svp_simple_024_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.bytetoword = type { i32 }

@svp_simple_024_001_global_array = common global [100 x i32*] zeroinitializer, align 16
@svp_simple_024_001_reset_RT = common global i8 0, align 1
@svp_simple_024_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_main() #0 !dbg !7 {
  %1 = alloca %union.bytetoword, align 4
  %2 = alloca %union.bytetoword, align 4
  %3 = alloca %union.bytetoword, align 4
  %4 = alloca %union.bytetoword, align 4
  %5 = bitcast %union.bytetoword* %3 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !10
  %6 = bitcast %union.bytetoword* %4 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !10
  %7 = call i32 (...) @rand() #3, !dbg !11
  store volatile i32 %7, i32* @svp_simple_024_001_global_var, align 4, !dbg !14, !tbaa !15
  call void (...) @init() #3, !dbg !19
  %8 = bitcast %union.bytetoword* %2 to i8*, !dbg !20
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !20
  %9 = load i32, i32* getelementptr (i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i64 1), align 4, !dbg !23, !tbaa !15
  %10 = trunc i32 %9 to i8, !dbg !23
  %11 = bitcast %union.bytetoword* %2 to [2 x i8]*, !dbg !24
  %12 = getelementptr inbounds [2 x i8], [2 x i8]* %11, i64 0, i64 0, !dbg !25
  store i8 %10, i8* %12, align 4, !dbg !26, !tbaa !27
  %13 = load i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), align 4, !dbg !28, !tbaa !15
  %14 = trunc i32 %13 to i8, !dbg !28
  %15 = bitcast %union.bytetoword* %2 to [2 x i8]*, !dbg !29
  %16 = getelementptr inbounds [2 x i8], [2 x i8]* %15, i64 0, i64 1, !dbg !30
  store i8 %14, i8* %16, align 1, !dbg !31, !tbaa !27
  %17 = bitcast %union.bytetoword* %2 to i32*, !dbg !32
  %18 = load i32, i32* %17, align 4, !dbg !32, !tbaa !27
  %19 = bitcast %union.bytetoword* %2 to i8*, !dbg !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #3, !dbg !33
  %20 = bitcast %union.bytetoword* %3 to i32*, !dbg !34
  store i32 %18, i32* %20, align 4, !dbg !35, !tbaa !27
  %21 = bitcast %union.bytetoword* %1 to i8*, !dbg !36
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %21) #3, !dbg !36
  %22 = load i32, i32* bitcast (i32** getelementptr inbounds ([100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 1) to i32*), align 4, !dbg !38, !tbaa !15
  %23 = trunc i32 %22 to i8, !dbg !38
  %24 = bitcast %union.bytetoword* %1 to [2 x i8]*, !dbg !39
  %25 = getelementptr inbounds [2 x i8], [2 x i8]* %24, i64 0, i64 0, !dbg !40
  store i8 %23, i8* %25, align 4, !dbg !41, !tbaa !27
  %26 = load i32, i32* getelementptr (i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i64 1), align 4, !dbg !42, !tbaa !15
  %27 = trunc i32 %26 to i8, !dbg !42
  %28 = bitcast %union.bytetoword* %1 to [2 x i8]*, !dbg !43
  %29 = getelementptr inbounds [2 x i8], [2 x i8]* %28, i64 0, i64 1, !dbg !44
  store i8 %27, i8* %29, align 1, !dbg !45, !tbaa !27
  %30 = bitcast %union.bytetoword* %1 to i32*, !dbg !46
  %31 = load i32, i32* %30, align 4, !dbg !46, !tbaa !27
  %32 = bitcast %union.bytetoword* %1 to i8*, !dbg !47
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !47
  %33 = bitcast %union.bytetoword* %4 to i32*, !dbg !48
  store i32 %31, i32* %33, align 4, !dbg !49, !tbaa !27
  %34 = bitcast %union.bytetoword* %3 to i32*, !dbg !50
  %35 = load i32, i32* %34, align 4, !dbg !50, !tbaa !27
  %36 = bitcast %union.bytetoword* %4 to i32*, !dbg !51
  %37 = load i32, i32* %36, align 4, !dbg !51, !tbaa !27
  %38 = and i32 %37, 752, !dbg !52
  %39 = or i32 %35, %38, !dbg !53
  switch i32 %39, label %42 [
    i32 752, label %40
    i32 912, label %41
  ], !dbg !54

40:                                               ; preds = %0
  store volatile i8 1, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !55, !tbaa !27
  br label %43, !dbg !56

41:                                               ; preds = %0
  store volatile i8 0, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !57, !tbaa !27
  br label %43, !dbg !58

42:                                               ; preds = %0
  br label %43, !dbg !59

43:                                               ; preds = %42, %41, %40
  %44 = bitcast %union.bytetoword* %4 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3, !dbg !60
  %45 = bitcast %union.bytetoword* %3 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %45) #3, !dbg !60
  ret void, !dbg !60
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_024_001_RTData(i32* %0, i32 %1) #0 !dbg !21 {
  %3 = alloca %union.bytetoword, align 4
  %4 = bitcast %union.bytetoword* %3 to i8*, !dbg !61
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !61
  %5 = add nsw i32 %1, 1, !dbg !62
  %6 = sext i32 %5 to i64, !dbg !63
  %7 = getelementptr inbounds i32, i32* %0, i64 %6, !dbg !63
  %8 = load i32, i32* %7, align 4, !dbg !63, !tbaa !15
  %9 = trunc i32 %8 to i8, !dbg !63
  %10 = bitcast %union.bytetoword* %3 to [2 x i8]*, !dbg !64
  %11 = getelementptr inbounds [2 x i8], [2 x i8]* %10, i64 0, i64 0, !dbg !65
  store i8 %9, i8* %11, align 4, !dbg !66, !tbaa !27
  %12 = sext i32 %1 to i64, !dbg !67
  %13 = getelementptr inbounds i32, i32* %0, i64 %12, !dbg !67
  %14 = load i32, i32* %13, align 4, !dbg !67, !tbaa !15
  %15 = trunc i32 %14 to i8, !dbg !67
  %16 = bitcast %union.bytetoword* %3 to [2 x i8]*, !dbg !68
  %17 = getelementptr inbounds [2 x i8], [2 x i8]* %16, i64 0, i64 1, !dbg !69
  store i8 %15, i8* %17, align 1, !dbg !70, !tbaa !27
  %18 = bitcast %union.bytetoword* %3 to i32*, !dbg !71
  %19 = load i32, i32* %18, align 4, !dbg !71, !tbaa !27
  %20 = bitcast %union.bytetoword* %3 to i8*, !dbg !72
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !72
  ret i32 %19, !dbg !73
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_init() #0 !dbg !12 {
  %1 = call i32 (...) @rand(), !dbg !74
  store volatile i32 %1, i32* @svp_simple_024_001_global_var, align 4, !dbg !75, !tbaa !15
  call void (...) @init(), !dbg !76
  ret void, !dbg !77
}

declare i32 @rand(...) #2

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_isr_1() #0 !dbg !78 {
  br label %1, !dbg !79

1:                                                ; preds = %7, %0
  %.0 = phi i32 [ 0, %0 ], [ %8, %7 ], !dbg !80
  %2 = icmp slt i32 %.0, 100, !dbg !81
  br i1 %2, label %4, label %3, !dbg !82

3:                                                ; preds = %1
  br label %9

4:                                                ; preds = %1
  %5 = sext i32 %.0 to i64, !dbg !83
  %6 = getelementptr inbounds [100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 %5, !dbg !83
  store i32* null, i32** %6, align 8, !dbg !84, !tbaa !85
  br label %7, !dbg !87

7:                                                ; preds = %4
  %8 = add nsw i32 %.0, 1, !dbg !88
  br label %1, !dbg !82, !llvm.loop !89

9:                                                ; preds = %3
  ret void, !dbg !90
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_024")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_024_001_main", scope: !8, file: !8, line: 29, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_024")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 30, column: 3, scope: !7)
!11 = !DILocation(line: 49, column: 35, scope: !12, inlinedAt: !13)
!12 = distinct !DISubprogram(name: "svp_simple_024_001_init", scope: !8, file: !8, line: 48, type: !9, scopeLine: 48, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = distinct !DILocation(line: 31, column: 3, scope: !7)
!14 = !DILocation(line: 49, column: 33, scope: !12, inlinedAt: !13)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 51, column: 3, scope: !12, inlinedAt: !13)
!20 = !DILocation(line: 55, column: 3, scope: !21, inlinedAt: !22)
!21 = distinct !DISubprogram(name: "svp_simple_024_001_RTData", scope: !8, file: !8, line: 54, type: !9, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = distinct !DILocation(line: 32, column: 41, scope: !7)
!23 = !DILocation(line: 56, column: 44, scope: !21, inlinedAt: !22)
!24 = !DILocation(line: 56, column: 30, scope: !21, inlinedAt: !22)
!25 = !DILocation(line: 56, column: 3, scope: !21, inlinedAt: !22)
!26 = !DILocation(line: 56, column: 42, scope: !21, inlinedAt: !22)
!27 = !{!17, !17, i64 0}
!28 = !DILocation(line: 57, column: 44, scope: !21, inlinedAt: !22)
!29 = !DILocation(line: 57, column: 30, scope: !21, inlinedAt: !22)
!30 = !DILocation(line: 57, column: 3, scope: !21, inlinedAt: !22)
!31 = !DILocation(line: 57, column: 42, scope: !21, inlinedAt: !22)
!32 = !DILocation(line: 59, column: 37, scope: !21, inlinedAt: !22)
!33 = !DILocation(line: 60, column: 1, scope: !21, inlinedAt: !22)
!34 = !DILocation(line: 32, column: 30, scope: !7)
!35 = !DILocation(line: 32, column: 39, scope: !7)
!36 = !DILocation(line: 55, column: 3, scope: !21, inlinedAt: !37)
!37 = distinct !DILocation(line: 33, column: 41, scope: !7)
!38 = !DILocation(line: 56, column: 44, scope: !21, inlinedAt: !37)
!39 = !DILocation(line: 56, column: 30, scope: !21, inlinedAt: !37)
!40 = !DILocation(line: 56, column: 3, scope: !21, inlinedAt: !37)
!41 = !DILocation(line: 56, column: 42, scope: !21, inlinedAt: !37)
!42 = !DILocation(line: 57, column: 44, scope: !21, inlinedAt: !37)
!43 = !DILocation(line: 57, column: 30, scope: !21, inlinedAt: !37)
!44 = !DILocation(line: 57, column: 3, scope: !21, inlinedAt: !37)
!45 = !DILocation(line: 57, column: 42, scope: !21, inlinedAt: !37)
!46 = !DILocation(line: 59, column: 37, scope: !21, inlinedAt: !37)
!47 = !DILocation(line: 60, column: 1, scope: !21, inlinedAt: !37)
!48 = !DILocation(line: 33, column: 30, scope: !7)
!49 = !DILocation(line: 33, column: 39, scope: !7)
!50 = !DILocation(line: 35, column: 34, scope: !7)
!51 = !DILocation(line: 35, column: 72, scope: !7)
!52 = !DILocation(line: 35, column: 81, scope: !7)
!53 = !DILocation(line: 35, column: 43, scope: !7)
!54 = !DILocation(line: 37, column: 3, scope: !7)
!55 = !DILocation(line: 39, column: 35, scope: !7)
!56 = !DILocation(line: 40, column: 7, scope: !7)
!57 = !DILocation(line: 42, column: 35, scope: !7)
!58 = !DILocation(line: 43, column: 7, scope: !7)
!59 = !DILocation(line: 45, column: 7, scope: !7)
!60 = !DILocation(line: 47, column: 1, scope: !7)
!61 = !DILocation(line: 55, column: 3, scope: !21)
!62 = !DILocation(line: 56, column: 56, scope: !21)
!63 = !DILocation(line: 56, column: 44, scope: !21)
!64 = !DILocation(line: 56, column: 30, scope: !21)
!65 = !DILocation(line: 56, column: 3, scope: !21)
!66 = !DILocation(line: 56, column: 42, scope: !21)
!67 = !DILocation(line: 57, column: 44, scope: !21)
!68 = !DILocation(line: 57, column: 30, scope: !21)
!69 = !DILocation(line: 57, column: 3, scope: !21)
!70 = !DILocation(line: 57, column: 42, scope: !21)
!71 = !DILocation(line: 59, column: 37, scope: !21)
!72 = !DILocation(line: 60, column: 1, scope: !21)
!73 = !DILocation(line: 59, column: 3, scope: !21)
!74 = !DILocation(line: 49, column: 35, scope: !12)
!75 = !DILocation(line: 49, column: 33, scope: !12)
!76 = !DILocation(line: 51, column: 3, scope: !12)
!77 = !DILocation(line: 52, column: 1, scope: !12)
!78 = distinct !DISubprogram(name: "svp_simple_024_001_isr_1", scope: !8, file: !8, line: 61, type: !9, scopeLine: 61, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!79 = !DILocation(line: 62, column: 8, scope: !78)
!80 = !DILocation(line: 0, scope: !78)
!81 = !DILocation(line: 62, column: 21, scope: !78)
!82 = !DILocation(line: 62, column: 3, scope: !78)
!83 = !DILocation(line: 63, column: 5, scope: !78)
!84 = !DILocation(line: 63, column: 40, scope: !78)
!85 = !{!86, !86, i64 0}
!86 = !{!"any pointer", !17, i64 0}
!87 = !DILocation(line: 64, column: 3, scope: !78)
!88 = !DILocation(line: 62, column: 29, scope: !78)
!89 = distinct !{!89, !82, !87}
!90 = !DILocation(line: 65, column: 1, scope: !78)
