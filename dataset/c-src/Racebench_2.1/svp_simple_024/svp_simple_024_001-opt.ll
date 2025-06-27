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
  call void (...) @init() #3, !dbg !11
  %7 = bitcast %union.bytetoword* %2 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !14
  %8 = load i32, i32* getelementptr (i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i64 1), align 4, !dbg !17, !tbaa !18
  %9 = trunc i32 %8 to i8, !dbg !17
  %10 = bitcast %union.bytetoword* %2 to [2 x i8]*, !dbg !22
  %11 = getelementptr inbounds [2 x i8], [2 x i8]* %10, i64 0, i64 0, !dbg !23
  store i8 %9, i8* %11, align 4, !dbg !24, !tbaa !25
  %12 = load i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), align 4, !dbg !26, !tbaa !18
  %13 = trunc i32 %12 to i8, !dbg !26
  %14 = bitcast %union.bytetoword* %2 to [2 x i8]*, !dbg !27
  %15 = getelementptr inbounds [2 x i8], [2 x i8]* %14, i64 0, i64 1, !dbg !28
  store i8 %13, i8* %15, align 1, !dbg !29, !tbaa !25
  %16 = bitcast %union.bytetoword* %2 to i32*, !dbg !30
  %17 = load i32, i32* %16, align 4, !dbg !30, !tbaa !25
  %18 = bitcast %union.bytetoword* %2 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !31
  %19 = bitcast %union.bytetoword* %3 to i32*, !dbg !32
  store i32 %17, i32* %19, align 4, !dbg !33, !tbaa !25
  %20 = bitcast %union.bytetoword* %1 to i8*, !dbg !34
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #3, !dbg !34
  %21 = load i32, i32* bitcast (i32** getelementptr inbounds ([100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 1) to i32*), align 4, !dbg !36, !tbaa !18
  %22 = trunc i32 %21 to i8, !dbg !36
  %23 = bitcast %union.bytetoword* %1 to [2 x i8]*, !dbg !37
  %24 = getelementptr inbounds [2 x i8], [2 x i8]* %23, i64 0, i64 0, !dbg !38
  store i8 %22, i8* %24, align 4, !dbg !39, !tbaa !25
  %25 = load i32, i32* getelementptr (i32, i32* bitcast ([100 x i32*]* @svp_simple_024_001_global_array to i32*), i64 1), align 4, !dbg !40, !tbaa !18
  %26 = trunc i32 %25 to i8, !dbg !40
  %27 = bitcast %union.bytetoword* %1 to [2 x i8]*, !dbg !41
  %28 = getelementptr inbounds [2 x i8], [2 x i8]* %27, i64 0, i64 1, !dbg !42
  store i8 %26, i8* %28, align 1, !dbg !43, !tbaa !25
  %29 = bitcast %union.bytetoword* %1 to i32*, !dbg !44
  %30 = load i32, i32* %29, align 4, !dbg !44, !tbaa !25
  %31 = bitcast %union.bytetoword* %1 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #3, !dbg !45
  %32 = bitcast %union.bytetoword* %4 to i32*, !dbg !46
  store i32 %30, i32* %32, align 4, !dbg !47, !tbaa !25
  %33 = bitcast %union.bytetoword* %3 to i32*, !dbg !48
  %34 = load i32, i32* %33, align 4, !dbg !48, !tbaa !25
  %35 = bitcast %union.bytetoword* %4 to i32*, !dbg !49
  %36 = load i32, i32* %35, align 4, !dbg !49, !tbaa !25
  %37 = and i32 %36, 752, !dbg !50
  %38 = or i32 %34, %37, !dbg !51
  switch i32 %38, label %41 [
    i32 752, label %39
    i32 912, label %40
  ], !dbg !52

39:                                               ; preds = %0
  store volatile i8 1, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !53, !tbaa !25
  br label %42, !dbg !54

40:                                               ; preds = %0
  store volatile i8 0, i8* @svp_simple_024_001_reset_RT, align 1, !dbg !55, !tbaa !25
  br label %42, !dbg !56

41:                                               ; preds = %0
  br label %42, !dbg !57

42:                                               ; preds = %41, %40, %39
  %43 = bitcast %union.bytetoword* %4 to i8*, !dbg !58
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3, !dbg !58
  %44 = bitcast %union.bytetoword* %3 to i8*, !dbg !58
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #3, !dbg !58
  ret void, !dbg !58
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_024_001_RTData(i32* %0, i32 %1) #0 !dbg !15 {
  %3 = alloca %union.bytetoword, align 4
  %4 = bitcast %union.bytetoword* %3 to i8*, !dbg !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !59
  %5 = add nsw i32 %1, 1, !dbg !60
  %6 = sext i32 %5 to i64, !dbg !61
  %7 = getelementptr inbounds i32, i32* %0, i64 %6, !dbg !61
  %8 = load i32, i32* %7, align 4, !dbg !61, !tbaa !18
  %9 = trunc i32 %8 to i8, !dbg !61
  %10 = bitcast %union.bytetoword* %3 to [2 x i8]*, !dbg !62
  %11 = getelementptr inbounds [2 x i8], [2 x i8]* %10, i64 0, i64 0, !dbg !63
  store i8 %9, i8* %11, align 4, !dbg !64, !tbaa !25
  %12 = sext i32 %1 to i64, !dbg !65
  %13 = getelementptr inbounds i32, i32* %0, i64 %12, !dbg !65
  %14 = load i32, i32* %13, align 4, !dbg !65, !tbaa !18
  %15 = trunc i32 %14 to i8, !dbg !65
  %16 = bitcast %union.bytetoword* %3 to [2 x i8]*, !dbg !66
  %17 = getelementptr inbounds [2 x i8], [2 x i8]* %16, i64 0, i64 1, !dbg !67
  store i8 %15, i8* %17, align 1, !dbg !68, !tbaa !25
  %18 = bitcast %union.bytetoword* %3 to i32*, !dbg !69
  %19 = load i32, i32* %18, align 4, !dbg !69, !tbaa !25
  %20 = bitcast %union.bytetoword* %3 to i8*, !dbg !70
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3, !dbg !70
  ret i32 %19, !dbg !71
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_init() #0 !dbg !12 {
  call void (...) @init(), !dbg !72
  ret void, !dbg !73
}

declare void @init(...) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_024_001_isr_1() #0 !dbg !74 {
  br label %1, !dbg !75

1:                                                ; preds = %7, %0
  %.0 = phi i32 [ 0, %0 ], [ %8, %7 ], !dbg !76
  %2 = icmp slt i32 %.0, 100, !dbg !77
  br i1 %2, label %4, label %3, !dbg !78

3:                                                ; preds = %1
  br label %9

4:                                                ; preds = %1
  %5 = sext i32 %.0 to i64, !dbg !79
  %6 = getelementptr inbounds [100 x i32*], [100 x i32*]* @svp_simple_024_001_global_array, i64 0, i64 %5, !dbg !79
  store i32* null, i32** %6, align 8, !dbg !80, !tbaa !81
  br label %7, !dbg !83

7:                                                ; preds = %4
  %8 = add nsw i32 %.0, 1, !dbg !84
  br label %1, !dbg !78, !llvm.loop !85

9:                                                ; preds = %3
  ret void, !dbg !86
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_024")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_024_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_024_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_024")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 15, column: 3, scope: !7)
!11 = !DILocation(line: 36, column: 3, scope: !12, inlinedAt: !13)
!12 = distinct !DISubprogram(name: "svp_simple_024_001_init", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = distinct !DILocation(line: 16, column: 3, scope: !7)
!14 = !DILocation(line: 40, column: 3, scope: !15, inlinedAt: !16)
!15 = distinct !DISubprogram(name: "svp_simple_024_001_RTData", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!16 = distinct !DILocation(line: 17, column: 41, scope: !7)
!17 = !DILocation(line: 41, column: 44, scope: !15, inlinedAt: !16)
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C/C++ TBAA"}
!22 = !DILocation(line: 41, column: 30, scope: !15, inlinedAt: !16)
!23 = !DILocation(line: 41, column: 3, scope: !15, inlinedAt: !16)
!24 = !DILocation(line: 41, column: 42, scope: !15, inlinedAt: !16)
!25 = !{!20, !20, i64 0}
!26 = !DILocation(line: 42, column: 44, scope: !15, inlinedAt: !16)
!27 = !DILocation(line: 42, column: 30, scope: !15, inlinedAt: !16)
!28 = !DILocation(line: 42, column: 3, scope: !15, inlinedAt: !16)
!29 = !DILocation(line: 42, column: 42, scope: !15, inlinedAt: !16)
!30 = !DILocation(line: 44, column: 37, scope: !15, inlinedAt: !16)
!31 = !DILocation(line: 45, column: 1, scope: !15, inlinedAt: !16)
!32 = !DILocation(line: 17, column: 30, scope: !7)
!33 = !DILocation(line: 17, column: 39, scope: !7)
!34 = !DILocation(line: 40, column: 3, scope: !15, inlinedAt: !35)
!35 = distinct !DILocation(line: 18, column: 41, scope: !7)
!36 = !DILocation(line: 41, column: 44, scope: !15, inlinedAt: !35)
!37 = !DILocation(line: 41, column: 30, scope: !15, inlinedAt: !35)
!38 = !DILocation(line: 41, column: 3, scope: !15, inlinedAt: !35)
!39 = !DILocation(line: 41, column: 42, scope: !15, inlinedAt: !35)
!40 = !DILocation(line: 42, column: 44, scope: !15, inlinedAt: !35)
!41 = !DILocation(line: 42, column: 30, scope: !15, inlinedAt: !35)
!42 = !DILocation(line: 42, column: 3, scope: !15, inlinedAt: !35)
!43 = !DILocation(line: 42, column: 42, scope: !15, inlinedAt: !35)
!44 = !DILocation(line: 44, column: 37, scope: !15, inlinedAt: !35)
!45 = !DILocation(line: 45, column: 1, scope: !15, inlinedAt: !35)
!46 = !DILocation(line: 18, column: 30, scope: !7)
!47 = !DILocation(line: 18, column: 39, scope: !7)
!48 = !DILocation(line: 20, column: 34, scope: !7)
!49 = !DILocation(line: 20, column: 72, scope: !7)
!50 = !DILocation(line: 20, column: 81, scope: !7)
!51 = !DILocation(line: 20, column: 43, scope: !7)
!52 = !DILocation(line: 22, column: 3, scope: !7)
!53 = !DILocation(line: 24, column: 35, scope: !7)
!54 = !DILocation(line: 25, column: 7, scope: !7)
!55 = !DILocation(line: 27, column: 35, scope: !7)
!56 = !DILocation(line: 28, column: 7, scope: !7)
!57 = !DILocation(line: 30, column: 7, scope: !7)
!58 = !DILocation(line: 32, column: 1, scope: !7)
!59 = !DILocation(line: 40, column: 3, scope: !15)
!60 = !DILocation(line: 41, column: 56, scope: !15)
!61 = !DILocation(line: 41, column: 44, scope: !15)
!62 = !DILocation(line: 41, column: 30, scope: !15)
!63 = !DILocation(line: 41, column: 3, scope: !15)
!64 = !DILocation(line: 41, column: 42, scope: !15)
!65 = !DILocation(line: 42, column: 44, scope: !15)
!66 = !DILocation(line: 42, column: 30, scope: !15)
!67 = !DILocation(line: 42, column: 3, scope: !15)
!68 = !DILocation(line: 42, column: 42, scope: !15)
!69 = !DILocation(line: 44, column: 37, scope: !15)
!70 = !DILocation(line: 45, column: 1, scope: !15)
!71 = !DILocation(line: 44, column: 3, scope: !15)
!72 = !DILocation(line: 36, column: 3, scope: !12)
!73 = !DILocation(line: 37, column: 1, scope: !12)
!74 = distinct !DISubprogram(name: "svp_simple_024_001_isr_1", scope: !8, file: !8, line: 46, type: !9, scopeLine: 46, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 47, column: 8, scope: !74)
!76 = !DILocation(line: 0, scope: !74)
!77 = !DILocation(line: 47, column: 21, scope: !74)
!78 = !DILocation(line: 47, column: 3, scope: !74)
!79 = !DILocation(line: 48, column: 5, scope: !74)
!80 = !DILocation(line: 48, column: 40, scope: !74)
!81 = !{!82, !82, i64 0}
!82 = !{!"any pointer", !20, i64 0}
!83 = !DILocation(line: 49, column: 3, scope: !74)
!84 = !DILocation(line: 47, column: 29, scope: !74)
!85 = distinct !{!85, !78, !83}
!86 = !DILocation(line: 50, column: 1, scope: !74)
